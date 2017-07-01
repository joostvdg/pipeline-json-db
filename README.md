# JSON DB

This is a small experimental container for tracking pipeline usage.

See [jenkins-pipeline-example.groovy](jenkins-pipeline-example.groovy) for an example pipeline code for what the intention is.

## json-server

This currently uses [json-server](https://www.npmjs.com/package/json-server).

## NodeJS Alpine Docker

The Docker image is based on [NodeJS 8 Alpine](https://hub.docker.com/_/node/) and [NodeJS Docker tutorial](https://nodejs.org/en/docs/guides/nodejs-docker-webapp/).

## How to use

* **build.sh** for building the docker image
* **run.sh** for running the docker image
* **service.sh** for creating a docker service
* **service-update.sh** for issuing a service update of the image (in case of rebuilding)
* **stack.sh** for creating a docker stack

Works together with [Docker Flow Proxy](proxy.dockerflow.com) for a Docker Swarm Mode reverse proxy (use the service or stack definition then).
