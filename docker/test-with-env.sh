#!/bin/bash
set -e

echo "Testing Docker container with local .env file..."

# Set the working directory to the root of the project
cd "$(dirname "$0")/.."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "Error: .env file not found in project root."
    echo "Please create an .env file with your environment variables."
    exit 1
fi

# Build the docker image with the .env file
echo "Building Docker image..."
docker build -t focusflow:test -f docker/Dockerfile .

# Run the container with the built image
echo "Running container..."
docker run -p 8000:8000 focusflow:test

# This line will only be reached if the container stops
echo "Container has stopped."
