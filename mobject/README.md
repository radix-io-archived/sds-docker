# Mobject base

This image serves as a base for any other images that want to use Mobject
within a container. 

## Building

Make sure to cd to the mobject/base directory, then run
`docker build -t mobject/base:1.0 .`

## Running

After building the container, it can be ran with `docker run -it mobject/base:1.0`.
This will launch a terminal (as root), where the user can run Mobject software.
The container environment should include spack, so the user can use that to load
the mobject module: `spack load mobject`. This puts Mobject binaries in PATH,
Mobject libaries in LD_LIBRARY_PATH, etc.

Note that the spack environment is only loaded if the container is ran as a BASH
login shell (e.g., the default run command above or
`docker run -it mobject/base:1.0 /bin/bash -l`). Otherwise, the user will have
to manually load the spack environment by running
`source $SPACK_ROOT/share/spack/setup-env.sh`.

# Mobject demo 

Based on the base Mobject image above, this image further launches a Mobject
cluster composed of a single server daemon that a user can interact with.

## Building

Make sure to cd to the mobject/demo directory, then run
`docker build -t mobject/demo:1.0 .`

## Running

To run the container, just execute:

`docker run -d --shm-size 105m mobject/demo`

`-d` is to run the container in the background (i.e., as a daemon)

`--shm-size <size>` is to set the size of `/dev/shm`, which should be greater than 100M

Run `docker ps` to confirm that the container is properly running. Commands can be ran
against this running container using `docker exec <container_id> <command>`.
