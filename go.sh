#!/bin/bash

mkdir -p build_output
docker build -t "build_ghidra" .
docker run -ti -v "${PWD}/build_output:/workdir/ghidra" build_ghidra
