#!/bin/sh
echo "$@"
docker run --rm --interactive --tty --device /dev/kvm  \
	--workdir /recipes --mount "type=bind,exec,source=$(pwd),destination=/recipes" --security-opt label=disable godebos/debos -b kvm $@
