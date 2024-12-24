FROM node:14.20.0-alpine as build



WORKDIR /usr/src/app

RUN chown -R 777  /usr/src/app


COPY package*.json ./



RUN npm install -g @angular/cli@16.2.6

RUN npm install

COPY . .

RUN npm run build

### STAGE 2: Run ###
FROM nginxinc/nginx-unprivileged

#### copy nginx conf
COPY ./config/nginx.conf /etc/nginx/conf.d/default.conf

#### copy artifact build from the 'build environment'
COPY --from=build /usr/src/app/dist/vitorspace/browser /usr/share/nginx/html

#### don't know what this is, but seems cool and techy
CMD ["nginx", "-g", "daemon off;"]

