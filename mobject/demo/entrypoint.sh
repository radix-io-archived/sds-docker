#!/bin/bash

MOBJECT_CLUSTER_FILE=/tmp/mobject-cluster.gid

source $SPACK_ROOT/share/spack/setup-env.sh
spack load bake
spack load mobject

# setup BAKE storage pool
bake-mkpool -s 100M /dev/shm/mobject.0.dat

# startup the mobject server daemon
mobject-server-daemon ofi+tcp $MOBJECT_CLUSTER_FILE
