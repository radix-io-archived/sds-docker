# Docker images for SDS utilities

We have put together a repo of docker images for some of our SDS utilities.
The target audience is not developers, but for potential users who would want
to try it out. For instance, these images would be helpful for Mochi tutorials,
where we would want to teach Margo without requesting everyone to install spack
and all Margo dependencies.  Attendees would just pull the Docker image instead
of building everything.  As Margo evolves, which should be less frequently now,
we can regenerate this image and either build it locally or push it to dockerhub.

As of this writing, this repo contains the following Docker images:

+ **mochi**: Image to be used as a base for SDS utility images or tutorials/demos.
             Installs spack and margo dependencies as root, and configures the spack
             environment.
+ **mobject/base**: Base image for mobject based on the mochi image above. Additionally
                    installs mobject and all of its dependencies (BAKE, sdskv, ssg, etc.)
                    via spack.
+ **mobject/demo**: Mobject demo image based on mobject/base. When ran as a container,
                    this demo bootstraps a Mobject cluster by starting a single server
                    daemon.

## Building the Mochi base image

To build the base Mochi image, run `docker build -t mochi:1.0 .` from the mochi
directory in this repository.

The resulting image will be about 1 Gigabyte and takes about 15 minutes to
build.

## Running the base Mochi image

The Mochi image can be ran with `docker run -it mochi:1.0`. This will launch
a terminal (as root) within the image, where the user can run Margo software,
install new software (using spack or a package manager), etc.

Note that the spack environment is only loaded if the container is ran as a BASH
login shell (e.g., the default run command above or
`docker run -it mochi:1.0 /bin/bash -l`). Otherwise, the user will have to
manually load the spack environment by running
`source $SPACK_ROOT/share/spack/setup-env.sh`.
