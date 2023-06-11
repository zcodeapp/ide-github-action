#!/usr/bin/env sh

IDE_VERSION="latest"
IDE_PORT="3000"
IDE_NETWORK="host"
IDE_CONTAINER_NAME="test_container"

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

echo "Version: [$IDE_VERSION]"
echo "Port: [$IDE_PORT]"

docker run --detach --publish=$IDE_PORT:80 --network=$IDE_NETWORK --name=$IDE_CONTAINER_NAME zcodeapp/ide:$IDE_VERSION
sleep 5
echo "Success run container [$IDE_CONTAINER_NAME - zcodeapp/ide:$IDE_VERSION - port $IDE_PORT - network $IDE_NETWORK]"