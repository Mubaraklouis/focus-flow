#!/bin/bash

# Check if .env.docker exists
if [ ! -f .env.docker ]; then
    echo "Error: .env.docker file not found."
    echo "Please create a .env.docker file with your secret values."
    exit 1
fi

# Load environment variables from .env.docker
source .env.docker

# Build the Docker image with secrets as build arguments
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

echo "Docker image built successfully with tag: focusflow:local"
echo "Run with: docker run -p 8000:8000 focusflow:local"
