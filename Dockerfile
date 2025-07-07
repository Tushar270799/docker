FROM ubuntu:22.04 # use base image
RUN apt upgrade -y ; apt update ; apt install tree -y #run command in container
LABEL name="Tushar Sonawane"
LABEL email="sonawane.tushar.work@gmail.com"
ENV NAME=tushar
ENV PASS=password 
RUN pwd>/tmp/root.txt
RUN cd /tmp
RUN pwd>/tmp/tmp.txt
RUN cd /tmp ; pwd>/tmp/tmp.txt
WORKDIR /etc
RUN pwd>/tmp/etc.txt
RUN pwd>/tmp/etc.txt
RUN apt update && \
    apt install -y sudo && \
    useradd -m -s /bin/bash -G sudo,root tushar && \
    echo 'tushar:password' | chpasswd && \
    echo 'tushar ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN whoami > /tmp/1stwhoami.txt
USER ${NAME}
USER root
RUN whoami > /tmp/2stwhoami.txt
RUN mkdir /tmp/project
COPY welcome.txt /tmp/project/
ADD https://rpmfind.net/linux/mageia/distrib/cauldron/armv7hl/media/core/release/libtopcom0-0.17.8-5.mga10.armv7hl.rpm /tmp/project
CMD ["tree"]
# Prevent prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive
# Install OpenSSH Server
RUN apt-get update && \
    apt-get install -y openssh-server && \
    mkdir /var/run/sshd
# Set root password (change this for security in production!)
RUN echo 'root:Kalyan123tush@r' | chpasswd
# Allow root login via SSH (for testing; restrict this in production)
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
# Expose SSH port
EXPOSE 22
# Start sshd in the background using a proper init or foreground process
CMD ["/usr/sbin/sshd", "-D"]



