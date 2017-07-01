FROM node:8-alpine

MAINTAINER Joost van der Griendt <joostvdg@gmail.com>
LABEL authors="Joost van der Griendt <joostvdg@gmail.com>"
LABEL version="1.0.0"
LABEL description="Simple json db for usage with pipelines."

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
EXPOSE 3000

RUN npm install -g json-server

COPY db.json /usr/src/app
COPY routes.json /usr/src/app
COPY json-server.json /usr/src/app

CMD [ "json-server", "db.json", "--routes", "routes.json" ]
