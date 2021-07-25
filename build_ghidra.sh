#!/bin/bash

# This script runs inside the docker container with the command "../build_ghidra.sh"
git pull
gradle -I gradle/support/fetchDependencies.gradle init
gradle buildGhidra
