#### Docker image or Tor and for routing via Tor browser
Borrowed heavily from Jess Frazz at Docker. 

Run command to get things done:

#       # Build tor image
#       docker build -t tor .
#
#       # Run tor
#       docker run -p 9050:9050 tor
#
#       # Run tor tests
#       docker run tor make check

Need to test the iptables file runs on a Mac.. I bet she did it on Linux
