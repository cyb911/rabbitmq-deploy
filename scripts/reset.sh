#!/bin/bash
set -e

ENV=$1

# 1️⃣ 参数校验
if [ -z "$ENV" ]; then
  echo "Usage: ./reset.sh local|test"
  exit 1
fi

# 2️⃣ 生产环境保护
if [ "$ENV" = "prod" ]; then
  echo "❌ Reset is NOT allowed in production"
  exit 1
fi

ENV_FILE=".env.$ENV"
DATA_DIR="./data/$ENV"

# 3️⃣ 环境文件校验
if [ ! -f "$ENV_FILE" ]; then
  echo "❌ Env file $ENV_FILE not found"
  exit 1
fi

echo "⚠️  Reset RabbitMQ data for ENV=$ENV"
echo "    Env file : $ENV_FILE"
echo "    Data dir : $DATA_DIR"

read -p "This will DELETE ALL DATA. Are you sure? (yes/no): " confirm
if [ "$confirm" != "yes" ]; then
  echo "Abort."
  exit 0
fi

# 4️⃣ 停容器 + 删除 volume
docker-compose --env-file "$ENV_FILE" down -v

# 5️⃣ 删除本地数据目录
if [ -d "$DATA_DIR" ]; then
  echo "Removing $DATA_DIR"
  rm -rf "$DATA_DIR"
else
  echo "Data directory $DATA_DIR does not exist, skip."
fi

echo "✅ RabbitMQ data reset completed for ENV=$ENV"
