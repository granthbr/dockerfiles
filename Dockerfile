FROM alpine:latest
MAINTAINER Brandon Grantham <brandon.grantham@gmail.com>

RUN apk update && apk add \
	ca-certificates \
	python \
	py-pip \
	&& rm -rf /var/cache/apk/* \
	&& pip install dcoscli

# path to the DCOS CLI binary
RUN echo 'export PATH=$PATH:/dcos/bin;' >> ~/.bashrc

ENTRYPOINT [ "dcos" ]
