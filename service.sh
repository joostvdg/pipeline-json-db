#!/usr/bin/env bash
NAME=jsondb
IMAGE=jvdg-pl-jsondb-image
NETWORK=proxy

docker service create \
    --name $NAME \
    --network $NETWORK \
    --label com.docker.stack.namespace=$NAME \
    --container-label com.docker.stack.namespace=$NAME \
    --label com.df.notify=true \
    --label com.df.distribute=true \
    --label com.df.servicePath=/jsondb/ \
    --label com.df.port=3000 \
    $IMAGE