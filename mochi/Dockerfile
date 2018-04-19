FROM ubuntu
MAINTAINER ssio-services@lists.mcs.anl.gov

SHELL ["/bin/bash", "-c"]

ENV SPACK_ROOT=/usr/local \
    FORCE_UNSAFE_CONFIGURE=1

# Install packages
RUN apt-get update &&       \
    apt-get install -y      \
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

# Clone spack and setup its environment
RUN curl -s -L https://github.com/llnl/spack/archive/develop.tar.gz | \
        tar xzC $SPACK_ROOT --strip 1 && \
    echo 'module() { eval `/usr/bin/modulecmd sh $*`; }' >> $SPACK_ROOT/share/spack/setup-env.sh && \
    echo "source $SPACK_ROOT/share/spack/setup-env.sh" >> /etc/profile.d/spack.sh

# Copy defaut-installed packages
COPY packages.yaml $SPACK_ROOT/etc/spack

# Clone sds-repo, add it for spack, and install margo and dependencies
RUN git clone https://xgitlab.cels.anl.gov/sds/sds-repo.git && \
    spack repo add sds-repo && \
    spack install margo

CMD ["/bin/bash", "-l"]
