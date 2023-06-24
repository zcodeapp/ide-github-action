#!/usr/bin/env sh

IDE_VERSION="latest"
IDE_PORT="3000"
IDE_NETWORK="host"
IDE_CONTAINER_NAME="test_container"
IDE_RATE_POINTS="5"
IDE_RATE_DURATION="600"
IDE_SERVER_KEY="355b5636-3c3e-4e57-97ad-5e1dd40283a2"

if [ -n "$1" ]; then
  IDE_VERSION=$1
fi
if [ -n "$2" ]; then
  IDE_PORT=$2
fi
if [ -n "$3" ]; then
  IDE_NETWORK=$3
fi
if [ -n "$4" ]; then
  IDE_CONTAINER_NAME=$4
fi
if [ -n "$5" ]; then
  IDE_RATE_POINTS=$5
fi
if [ -n "$6" ]; then
  IDE_RATE_DURATION=$6
fi
if [ -n "$7" ]; then
  IDE_SERVER_KEY=$7
fi

echo "Version: [$IDE_VERSION]"
echo "Port: [$IDE_PORT]"

docker run --detach --publish=$IDE_PORT:80 --name=$IDE_CONTAINER_NAME -e RATE_POINTS=$IDE_RATE_POINTS -e RATE_DURATION=$IDE_RATE_DURATION -e SERVER_KEY="$IDE_SERVER_KEY" zcodeapp/ide:$IDE_VERSION
sleep 5
echo "Success run container [$IDE_CONTAINER_NAME - zcodeapp/ide:$IDE_VERSION - port $IDE_PORT - network $IDE_NETWORK]"