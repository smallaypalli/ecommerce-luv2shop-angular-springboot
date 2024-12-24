FROM node:14.20.0-alpine as build

USER node

WORKDIR /app

RUN chown -R node:root  /app


COPY package*.json ./

RUN npm install

RUN npm install -g @angular/cli@16.2.6

RUN mkdir -p /app/.angular && chown node:root -R  /app/.angular/*

COPY . /app





RUN npm run build
RUN chown node:root  -R  node_modules

RUN chown node:root  -R  /app/*


CMD ["ng", "serve"]

