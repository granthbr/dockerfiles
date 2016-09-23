#### Customized by Brandon Grantham
simple start for running locally
docker run -d granthbr/neo4j neo4j

How to use this image
Start an instance of neo4j
You can start a Neo4j container like this:

docker run \
    --publish=7474:7474 --publish=7687:7687 \
    --volume=$HOME/neo4j/data:/data \
    neo4j
which allows you to access neo4j through your browser at http://localhost:7474.

This binds two ports (7474 and 7687) for HTTP and Bolt access to the Neo4j API. A volume is bound to /data to allow the database to be persisted outside the container.

By default, this requires you to login with neo4j/neo4j and change the password. You can, for development purposes, disable authentication by passing --env=NEO4J_AUTH=none to docker run.

Note on version 2.3
Neo4j 3.0 introduced several major user-facing changes, primarily the new binary Bolt protocol. This is not available in 2.3 and as such, there is no need to expose the 7687 port. Due to changes made to the structure of configuration files, several environment variables used to configure the image has changed as well. Please see the 2.x specific section in the manual for further details.

You can start an instance of Neo4j 2.3 like this:

docker run \
    --publish=7474:7474 \
    --volume=$HOME/neo4j/data:/data \
    neo4j:2.3
Documentation
For more examples and complete documentation please go here for 2.x and here for 3.x.

Supported Docker versions
This image is officially supported on Docker version 1.12.1.

Support for older versions (down to 1.6) is provided on a best-effort basis.

Please see the Docker installation documentation for details on how to upgrade your Docker daemon.

User Feedback
Issues
If you have any problems with or questions about this image, please contact us through a GitHub issue.

For general Neo4j questions, please ask on StackOverflow.

Contributing
We welcome pull requests on GitHub.
