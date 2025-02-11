#!/bin/bash

source ./env.sh
docker rm -f $(docker ps -a -q -f name=^/${CONTAINER_NAME}$)

