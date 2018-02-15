# Docker image for SDS utilities

We have put together a docker image with Margo + its dependencies.  The target
audience is not developers, but for potential users who would want to try it out.

Consider Mochi tutorials, where we would want to teach Margo without requesting
everyone to install spack and all Margo dependencies.  Attendees would just
pull the Docker image instead of building everything.  As Margo evolves, which
should be less frequently now, we can regenerate this image and either build it
locally or push it to dockerhub.


## Building

To build the image run `docker build -t margo:1.0 .` from this checked-out
repository.

The build process will create a user named “bob” and install spack for him (not as root).

The resulting image will be about 1 Gigabyte and takes about 15 minutes to
build.

## Running

You run it with `docker run -it mochi:0.1 /bin/bash`

You will be logged in as “bob” on the container.  Note that because of the way
we installed the module environments, you have to use bash as you shell
