#!/bin/bash

ENV_FILE=$1

if [ -z "$ENV_FILE" ]; then
  echo "Usage: ./up.sh local|test|prod"
  exit 1
fi

docker-compose --env-file .env.$ENV_FILE up -d