FROM ubuntu:14.04

MAINTAINER Brandon Grantham <brandon.grantham@gmail.com>

FROM ubuntu:14.04
MAINTAINER Your Name
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -f -y libmysqlclient-dev \ 
    &&  touch /var/log/error.log && chmod 664 /var/log/error.log
