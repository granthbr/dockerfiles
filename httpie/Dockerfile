FROM alpine:latest
MAINTAINER Brandon Grantham <brandon.grantham@gmail.com>

RUN apk --no-cache add \
	ca-certificates \
	python \
	py-pip \
	&& pip install httpie httpie-unixsocket

ENTRYPOINT ["httpie"]
