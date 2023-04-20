#!/bin/sh

docker run --rm -it --workdir /build --mount "type=bind,exec,source=$(pwd),destination=/build" --security-opt label=disable starfive-build
