#!/bin/bash
#===============================================================================
#
#          FILE:  start-spotify.sh
# 
#         USAGE:  ./start-spotify.sh 
# 
#   DESCRIPTION: script for runnning spotify inside a linux container 
# 
#       OPTIONS:  ---`
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:   (Brandon Grantham), 
#       COMPANY:  Nix
#       VERSION:  1.0
#       CREATED:  05/05/2016 07:21:53 PDT
#      REVISION:  1.0
#===============================================================================

# Set some colors
red='\e[0;31m'
lpurp='\e[1;35m'
yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${lpurp}Checking for X11${NC}" 
if [ ! -e /home/spotify/.Xauthority ];
then
    touch /home/spotify/.Xauthority
fi
if [ ! -d /tmp/.X11-unix/ ];
then
    echo -e "${red}[ERROR] * No X11 socket transfered! Please connect container with \"-v /tmp/.X11-unix:/tmp/.X11-unix\"${NC}"
    exit 1
fi
export DISPLAY="unix:0"

echo -e "${lpurp}Adding X11 Cookie $XCOOKIE ${NC}"
xauth add $XCOOKIE

echo -e "${lpurp}Checking for Pulseaudio${NC}" 
if [ ! -e /tmp/.spotify-pulse-socket ];
then
    echo -e "${red}[ERROR] * No Pulseaudio socket transfered! Please connect container with \"-v /tmp/.spotify-pulse-socket:/tmp/.spotify-pulse-socket\"${NC}"
    echo -e "${red}          You can create a Pulseaudio socket by running:${NC}"
    echo
    echo -e "${yellow}pactl load-module module-native-protocol-unix auth-anonymous=1 socket=/tmp/.spotify-pulse-socket${NC}"
    echo
    exit 1
fi

echo -e "${lpurp}Launching Spotify!${NC}"
pulseaudio -D &
PULSE_SERVER=/tmp/.spotify-pulse-socket spotify --ui.hardware_acceleration=false &>/dev/null

echo -e "${lpurp}Exiting! Goodbye${NC}"
exit 0
