docker-activeMQ-OracleJava-7
============================

MQ info:
console login: <containerIPAddress>:8161/admin/ 
username:admin
password:admin

Good Docker container with Apache Active MQ installed. Oracle Java 7 installed. 

To run the image and connect to it:

docker run -d --name amq granthbr/docker-activemq-oraclejava-7 

Run with static ports and an external config file

`docker run -d --name amq -p 8161:8161 -p 61616:61616 -p 61613:61613 -p 61617:61617 -v `pwd`/conf:/opt/activemq/conf granthbr/docker-activemq-oraclejava-7`


The start command with parameters is the last line of the Dockerfile.