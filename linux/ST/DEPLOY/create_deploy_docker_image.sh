#!/bin/bash

echo "Build ST deploy docker image"

docker build -t stdeploytest:v1.0.0 .
