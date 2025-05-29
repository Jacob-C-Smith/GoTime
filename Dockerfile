# syntax=docker/dockerfile:1

# Fedora for the operating system
FROM fedora

# Install the things we need
RUN dnf -y install git go make net-tools hostname

# Set the working directory to ~
WORKDIR /home

# Copy the source code FROM the source directory TO the docker container
COPY ./src /home/src

# Set the executable flag
# NOTE: Use "RUN" unless its the last
RUN (cd /home/src; chmod +x docker_fork.sh)

# NOTE: Use "CMD" only for the last
# Run the shell script
CMD (cd /home/src; ./docker_fork.sh)