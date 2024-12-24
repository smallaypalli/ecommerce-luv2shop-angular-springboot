FROM node:14.20.0-alpine as build

USER node

WORKDIR /app

RUN chown -R node:root  /app


COPY package*.json ./

RUN npm install

RUN npm install -g @angular/cli@16.2.6



### STAGE 2: Run ###
FROM nginxinc/nginx-unprivileged

#### copy nginx conf
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

#### copy artifact build from the 'build environment'
COPY --from=build /usr/src/app/dist/vitorspace/browser /usr/share/nginx/html

#### don't know what this is, but seems cool and techy
CMD ["nginx", "-g", "daemon off;"]

