#!/bin/bash
set -e

echo "Starting local Docker build..."

# Set the working directory to the root of the project
cd "$(dirname "$0")/.."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "Warning: .env file not found in project root."
    echo "Checking for .env.docker..."

    # Check if .env.docker exists as fallback
    if [ ! -f .env.docker ]; then
        echo "Error: Neither .env nor .env.docker file found."
        echo "Please create an .env file with your environment variables or create .env.docker"
        exit 1
    fi

    echo "Using .env.docker as fallback. Will be used as build args."
    USE_ENV_DOCKER=true
    source .env.docker
else
    echo "Found .env file in project root. It will be included in the Docker image."
    USE_ENV_DOCKER=false
fi

# Determine build command based on which env file we're using
if [ "$USE_ENV_DOCKER" = true ]; then
    echo "Building Docker image with .env.docker variables as build args..."
    # Build with build args from .env.docker
    docker build \
      --build-arg DB_CONNECTION=${DB_CONNECTION:-mysql} \
      --build-arg DB_HOST=${DB_HOST:-127.0.0.1} \
      --build-arg DB_PORT=${DB_PORT:-3306} \
      --build-arg DB_DATABASE=${DB_DATABASE:-laravel} \
      --build-arg DB_USERNAME=${DB_USERNAME:-root} \
      --build-arg DB_PASSWORD=${DB_PASSWORD:-} \
      --build-arg MAIL_MAILER=${MAIL_MAILER:-smtp} \
      --build-arg MAIL_HOST=${MAIL_HOST:-mailhog} \
      --build-arg MAIL_PORT=${MAIL_PORT:-1025} \
      --build-arg MAIL_USERNAME=${MAIL_USERNAME:-null} \
      --build-arg MAIL_PASSWORD=${MAIL_PASSWORD:-null} \
      --build-arg MAIL_ENCRYPTION=${MAIL_ENCRYPTION:-null} \
      --build-arg GOOGLE_CLIENT_ID=${GOOGLE_CLIENT_ID:-} \
      --build-arg GOOGLE_CLIENT_SECRET=${GOOGLE_CLIENT_SECRET:-} \
      --build-arg GITHUB_CLIENT_ID=${GITHUB_CLIENT_ID:-} \
      --build-arg GITHUB_CLIENT_SECRET=${GITHUB_CLIENT_SECRET:-} \
      -t focusflow:local \
      -f docker/Dockerfile .
else
    echo "Building Docker image with existing .env file included..."
    # Simple build that relies on the COPY . . in Dockerfile to include the .env
    docker build -t focusflow:local -f docker/Dockerfile .
fi

echo "Docker image built successfully with tag: focusflow:local"
echo ""
echo "To run the container:"
echo "docker run -p 8000:8000 focusflow:local"
echo ""
echo "To debug if you have issues:"
echo "docker run -it --entrypoint /bin/sh focusflow:local"
