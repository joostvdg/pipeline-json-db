#!/bin/bash
JSON_DB_CONTAINER="jvdg-pl-jsondb-instance"
JSON_DB_IMAGE="jvdg-pl-jsondb-image"
PORT=3000

RUNNING=`docker ps | grep -c $JSON_DB_CONTAINER`
if [ $RUNNING -gt 0 ]
then
   echo "[JSON_DB][run] Stopping $JSON_DB_CONTAINER"
   docker stop $JSON_DB_CONTAINER >> cow.log 2>&1
fi

EXISTING=`docker ps -a | grep -c $JSON_DB_CONTAINER`
if [ $EXISTING -gt 0 ]
then
   echo "[JSON_DB][run] Removing $JSON_DB_CONTAINER"
  docker rm $JSON_DB_CONTAINER
fi

echo "[JSON_DB][run] Running $JSON_DB_CONTAINER"
docker run --name $JSON_DB_CONTAINER -d ${JSON_DB_IMAGE}

echo "[JSON_DB]Tail the logs of the new instance"
sleep 3
docker logs $JSON_DB_CONTAINER

RUNNING=`docker ps | grep -c $JSON_DB_CONTAINER`
if [ $RUNNING -gt 0 ]
then
    echo "[JSON_DB][run] $JSON_DB_CONTAINER is up"
    IP=$(docker inspect --format '{{.NetworkSettings.Networks.bridge.IPAddress}}' $JSON_DB_CONTAINER)
    echo "IP address of the container: $IP"
    echo "http://${IP}:${PORT}"
fi
