#!/bin/bash

rm -rf build_output
# generate a random name so that it is not a static name
CONTAINER_NAME=$(tr -dc A-Za-z0-9 </dev/random | head -c 13)
docker run -ti --name "$CONTAINER_NAME" build_ghidra
CONTAINER=$(docker ps -a --format='{{.ID}}:{{.Names}}' | grep ":$CONTAINER_NAME" | cut -d ':' -f1)
docker cp "$CONTAINER:/workdir/ghidra" ./build_output
