#### Docker image or Tor and for routing via Tor browser
Borrowed heavily from Jess Frazz at Docker. 

Run command to get things done:
docker run -d \
    --net host \
    --restart always \
    --name tor \
    jess/tor

Need to test the iptables file runs on a Mac.. I bet she did it on Linux
