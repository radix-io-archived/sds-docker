FROM ubuntu
MAINTAINER ssio-services@lists.mcs.anl.gov

SHELL ["/bin/bash", "-c"]

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
        libboost-dev

# Create a user named Bob
RUN useradd -ms /bin/bash bob
USER bob
WORKDIR /home/bob

# Setup environment module for Bob 
RUN echo "module() { eval \`/usr/bin/modulecmd bash $*\`; }" >> .bashrc
# Clone spack
RUN git clone https://github.com/spack/spack
# Add spack source into bashrc
RUN echo "" >> .bashrc
RUN echo "source spack/share/spack/setup-env.sh" >> .bashrc
RUN echo "PATH=$PATH:/home/bob/spack/bin" >> .bashrc
RUN mkdir -p .spack/linux
# Copy defaut-installed packages
COPY packages.yaml /home/bob/.spack/linux/packages.yaml
# Clone sds-repo
RUN git clone https://xgitlab.cels.anl.gov/sds/sds-repo.git
# Add the repo for spack to use
RUN . spack/share/spack/setup-env.sh ; spack repo add sds-repo
# Install margo and its dependencies
RUN . spack/share/spack/setup-env.sh ; spack install margo
