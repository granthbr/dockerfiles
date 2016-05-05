
FROM debian:sid
MAINTAINER Brandon Grantham <brandon.grantham@gmail.com>

RUN apt-get update && apt-get install -y \
	netcat \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

ENTRYPOINT [ "netcat" ]
