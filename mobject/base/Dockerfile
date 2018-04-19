from mochi
MAINTAINER ssio-services@lists.mcs.anl.gov

SHELL ["/bin/bash", "-c"]

# Install packages
RUN apt-get update &&                   \
    apt-get install -y                  \
                doxygen                 \
                libboost-system-dev     \
                libboost-filesystem-dev

# Install mobject-store and its dependencies
RUN spack install mobject ^mpich

CMD ["/bin/bash", "-l"]
