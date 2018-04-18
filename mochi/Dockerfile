FROM ubuntu
MAINTAINER ssio-services@lists.mcs.anl.gov

SHELL ["/bin/bash", "-c"]

ENV SPACK_ROOT=/usr/local \
    FORCE_UNSAFE_CONFIGURE=1

# Install packages
RUN apt-get update
RUN apt-get install -y      \
        mpich               \
        vim                 \
        git                 \
        python              \
        curl                \
        procps              \
        build-essential     \
        environment-modules \
        cmake               \
        libboost-dev        \
        pkg-config          \
        autoconf            \
        automake            \
        libtool

# Clone spack
RUN curl -s -L https://api.github.com/repos/spack/spack/tarball | \
        tar xzC $SPACK_ROOT --strip 1

# Load spack env on login
RUN echo "source $SPACK_ROOT/share/spack/setup-env.sh" >> /etc/profile.d/spack.sh

# Copy defaut-installed packages
COPY packages.yaml $SPACK_ROOT/etc/spack

# Clone sds-repo
RUN git clone https://xgitlab.cels.anl.gov/sds/sds-repo.git
# Add the repo for spack to use
RUN spack repo add sds-repo
# Install margo and its dependencies
RUN spack install margo

CMD /bin/bash -l
