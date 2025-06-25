FROM ubuntu:22.04 # use base image
RUN apt upgrade -y ; apt update ; apt install tree -y #run command in container
LABEL name="Tushar Sonawane"
LABEL email="sonawane.tushar.work@gmail.com"
ENV NAME=tushar
ENV PASS=password 


