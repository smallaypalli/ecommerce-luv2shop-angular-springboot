FROM node:14.20.0-alpine as build



WORKDIR /app

RUN chmod 777 .

COPY package*.json ./

RUN npm install

RUN npm install -g @angular/cli@16.2.6

COPY  . .

RUN chmod 777 node_modules

RUN npm run build

CMD ["ng", "serve"]

