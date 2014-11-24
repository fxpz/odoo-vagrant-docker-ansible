# sshd
#
# VERSION               0.0.2
FROM ubuntu:14.04
MAINTAINER Sven Dowideit <SvenDowideit@docker.com>

RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd

CMD ["/usr/sbin/sshd", "-D"]
