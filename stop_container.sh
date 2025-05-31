#!/bin/bash
set -e

# Container name or partial match
CONTAINER_NAME="simple-python-flask-app"

# Find all running container IDs matching the name
RUNNING_CONTAINER_IDS=$(docker ps -aq --filter "name=$CONTAINER_NAME")

if [ -n "$RUNNING_CONTAINER_IDS" ]; then
  echo "Stopping and removing container(s) matching '$CONTAINER_NAME'..."
  docker stop $RUNNING_CONTAINER_IDS
  docker rm $RUNNING_CONTAINER_IDS
else
  echo "No running container found matching '$CONTAINER_NAME'."
fi
