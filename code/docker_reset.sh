#!/bin/bash

# Function to reset Docker for macOS
reset_docker_macos() {
    echo "Stopping Docker Desktop for macOS..."
    osascript -e 'quit app "Docker"'

    echo "Clearing all containers, images, volumes, and networks..."
    docker container stop "$(docker container ls -aq)" || true
    docker container rm "$(docker container ls -aq)" || true
    docker image rm "$(docker image ls -aq)" || true
    docker volume rm "$(docker volume ls -q)" || true
    docker network prune -f || true

    echo "Starting Docker Desktop for macOS..."
    open --background -a Docker

    echo "Waiting for Docker to start..."
    while ! docker system info > /dev/null 2>&1; do
        sleep 1
    done

    echo "Docker Desktop for macOS has been reset."
}

# Function to reset Docker for Linux
reset_docker_linux() {
    echo "Stopping Docker service..."
    sudo systemctl stop docker

    echo "Clearing all containers, images, volumes, and networks..."
    docker container stop "$(docker container ls -aq)" || true
    docker container rm "$(docker container ls -aq)" || true
    docker image rm "$(docker image ls -aq)" || true
    docker volume rm "$(docker volume ls -q)" || true
    docker network prune -f || true

    echo "Starting Docker service..."
    sudo systemctl start docker

    echo "Waiting for Docker to start..."
    while ! docker system info > /dev/null 2>&1; do
        sleep 1
    done

    echo "Docker for Linux has been reset."
}

# Determine the OS and execute the appropriate function
if [[ "$OSTYPE" == "darwin"* ]]; then
    reset_docker_macos
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    reset_docker_linux
else
    echo "Unsupported OS. This script only supports macOS and Linux."
    exit 1
fi
