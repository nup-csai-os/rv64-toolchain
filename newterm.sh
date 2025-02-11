#!/bin/bash

source ./env.sh

c=`docker ps -a -q -f name=^/${CONTAINER_NAME}$`

echo "Search: $c"

docker exec -ti $c /bin/bash

