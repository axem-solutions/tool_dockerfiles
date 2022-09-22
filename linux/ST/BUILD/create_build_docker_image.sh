#!/bin/bash

echo "Build ST build docker image"

docker build -t sttest:v1.0.0 .
