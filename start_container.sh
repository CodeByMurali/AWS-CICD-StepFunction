#!/bin/bash
set -e

# Pull the Docker image from Docker Hub
docker pull murali16394/simple-python-flask-app:latest

# Run Docker image as a container
echo
docker run -d --name simple-python-flask-app -p 5000:5000 murali16394/simple-python-flask-app:latest