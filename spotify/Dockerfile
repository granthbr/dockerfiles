#Run spotify in a container

#docker run -d \
#       -v /etc/localtime/:etc/localtime:ro \
#       -v /tmp/.X11-unix:/tmp/.X11-unix \
#	--device /dev/snd:/dev/snd \
#	-v $HOME/.spotify/config:/home/spotify/.config/spotify \
#	-v $HOME/.spotify/cache:/home/spotify/spotify \
#	--name spotify \
#	granthbr/spotify


FROM ubuntu
#FROM debian:sid
MAINTAINER Brandon Grantham <brandon.grantham@gmail.com>

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install software-properties-common
RUN DEBIAN_FRONTEND=noninteractive apt-add-repository -y "deb http://repository.spotify.com stable non-free" 
RUN DEBIAN_FRONTEND=noninteractive apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 94558F59 
RUN DEBIAN_FRONTEND=noninteractive apt-get update -qq 
RUN DEBIAN_FRONTEND=noninteractive apt-get -y --force-yes install spotify-client
RUN DEBIAN_FRONTEND=noninteractive apt-get -y install libpangoxft-1.0-0 libpangox-1.0-0 xauth pulseaudio

ADD start-spotify.sh /usr/bin/start/start-spotify.sh

RUN chmod +x /usr/bin/start-spotify.sh

RUN useradd -d /home/spotify -p "!" -m -g audio -c "Docker-Spotify" spotify
USER spotify
ENV HOME /home/spotify

VOLUME /home/spotify/

ENTRYPOINT "/usr/bin/start-spotify.sh"
