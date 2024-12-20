FROM node:14.20.0-alpine as build

USER node

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN npm install -g @angular/cli@16.2.6

COPY --chown==node:node . .

RUN npm run build

CMD ["ng", "serve"]

