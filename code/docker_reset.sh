#!/bin/bash

# Function to stop all containers and prune the system
cleanup_docker() {
    if docker system info > /dev/null 2>&1; then
        echo "Stopping all running Docker containers..."
        containers=$(docker ps -q)
        if [ -n "$containers" ]; then
            docker stop $containers
        else
            echo "No running containers to stop."
        fi

        echo "Clearing all containers, images, volumes, and networks..."
        docker system prune -a -f --volumes
    else
        echo "Docker daemon is not running. Skipping cleanup."
    fi
}

# Function to wait for Docker daemon to be ready
wait_for_docker() {
    local timeout=180 # 3 minutes
    local counter=0
    echo "Waiting for Docker to start..."
    until docker system info > /dev/null 2>&1; do
        if [ ${counter} -ge ${timeout} ]; then
            echo "Error: Timed out waiting for Docker to start." >&2
            exit 1
        fi
        sleep 1
        counter=$((counter + 1))
    done
    echo "Docker is running."
}

# Function to reset Docker for macOS
reset_docker_macos() {
    cleanup_docker

    if pgrep -f "Docker" > /dev/null; then
        echo "Stopping Docker Desktop for macOS..."
        osascript -e 'quit app "Docker"'

        echo "Waiting for Docker to shut down..."
        local timeout=60 # 1 minute
        local counter=0
        while pgrep -f "Docker" > /dev/null; do
            if [ ${counter} -ge ${timeout} ]; then
                echo "Docker did not shut down gracefully. Forcing quit..."
                if [[ "$(uname -m)" == "arm64" ]]; then
                    # Apple Silicon
                    killall Docker
                else
                    # Intel
                    killall "Docker Desktop"
                fi
                break
            fi
            sleep 1
            counter=$((counter + 1))
        done
        echo "Docker has been shut down."
    fi

    open --background -a Docker > /dev/null

    wait_for_docker

    echo "Docker Desktop for macOS has been reset."
}

# Function to reset Docker for Linux
reset_docker_linux() {
    cleanup_docker

    echo "Restarting docker service..."
    sudo systemctl restart docker

    wait_for_docker

    echo "Docker for Linux has been reset."
}

# Function to reset Docker for Windows
reset_docker_windows() {
    cleanup_docker

    echo "Stopping Docker Desktop for Windows..."
    taskkill //IM "Docker Desktop.exe" //F

    echo "Starting Docker Desktop for Windows..."
    start "" "C:\Program Files\Docker\Docker\Docker Desktop.exe" > /dev/null 2>&1

    wait_for_docker

    echo "Docker Desktop for Windows has been reset."
}

# Determine the OS and execute the appropriate function
if [[ "$OSTYPE" == "darwin"* ]]; then
    reset_docker_macos
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    reset_docker_linux
elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* ]]; then
    reset_docker_windows
else
    echo "Unsupported OS: $OSTYPE. This script only supports macOS, Linux, and Windows."
    exit 1
fi
