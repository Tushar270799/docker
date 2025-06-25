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



