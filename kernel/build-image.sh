#!/bin/sh

# Builds the build container image with
# all needed dependencies to build a
# starfive linux kernel

docker build -t starfive-build:latest
