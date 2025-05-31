#!/bin/bash
set -e

# Container name or partial match
CONTAINER_NAME="simple-python-flask-app"

# Find container ID(s) of any running container matching the name
RUNNING_CONTAINER_ID=$(docker ps -aq --filter "name=$CONTAINER_NAME")

if [ -n "$RUNNING_CONTAINER_ID" ]; then
  echo "Stopping running container(s) matching '$CONTAINER_NAME'..."
  docker stop $RUNNING_CONTAINER_ID
else
  echo "No running container found matching '$CONTAINER_NAME'."
fi
