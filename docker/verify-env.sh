#!/bin/bash
set -e

echo "Building and verifying Docker image with .env file..."

# Set the working directory to the root of the project
cd "$(dirname "$0")/.."

# Check if .env file exists
if [ ! -f .env ]; then
    echo "Error: .env file not found in project root."
    echo "Please create an .env file first."
    exit 1
fi

# Build the Docker image with the .env file
echo "Building Docker image..."
docker build -t focusflow:verify -f docker/Dockerfile .

# Run a temporary container to check the location of the .env file
echo "Verifying .env file location in the container..."
docker run --rm focusflow:verify sh -c "ls -la /app/.env && cat /app/.env | grep -v 'PASSWORD\|SECRET\|KEY'"

echo ""
echo "If you see the .env file listed above and some of its contents, it's correctly located in the container."
