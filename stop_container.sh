#!/bin/bash
set -e

CONTAINER_NAME="simple-python-flask-app"

# Get exact container ID
CONTAINER_ID=$(docker ps -aq --filter "name=^/${CONTAINER_NAME}$")

if [ -n "$CONTAINER_ID" ]; then
  echo "Stopping and removing container: $CONTAINER_NAME"
  docker stop "$CONTAINER_ID" || true
  docker rm "$CONTAINER_ID" || true
else
  echo "No existing container found with name $CONTAINER_NAME"
fi
