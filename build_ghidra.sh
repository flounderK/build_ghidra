#!/bin/bash

gradle -I gradle/support/fetchDependencies.gradle init
gradle buildGhidra
