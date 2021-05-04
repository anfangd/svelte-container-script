FROM node:16.0.0-alpine3.13

WORKDIR /home/workspace

RUN \
    apk update && \
    apk add curl git unzip vim wget

RUN npm install -g npm@7.11.2
RUN npm install -g degit
RUN nodejs -v && npm -v && npx -v
