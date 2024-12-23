FROM node:14.20.0-alpine as build



WORKDIR /app

RUN chmod -R 777 /


COPY  . . 

RUN npm install

RUN npm install -g @angular/cli@16.2.6

COPY . /app


RUN chmod -R 777 node_modules

RUN chmod -R 777 /


RUN npm run build

CMD ["ng", "serve"]

