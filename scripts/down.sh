#!/bin/bash
set -e

echo "Stopping RabbitMQ containers..."

docker-compose down

echo "RabbitMQ stopped."