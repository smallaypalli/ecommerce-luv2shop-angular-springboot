FROM node:14.20.0-alpine as build

USER node

WORKDIR /app

RUN chmod -R node:node 777 /app


COPY package*.json ./

RUN npm install

RUN npm install -g @angular/cli@16.2.6

RUN mkdir -p /app/.angular && chmod node:node -R 777 /app/.angular/*

COPY . /app





RUN npm run build
RUN chmod node:node  -R 777 node_modules

RUN chmod node:node  -R 777 /app/*


CMD ["ng", "serve"]

