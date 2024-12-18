FROM node:14.20.0-alpine as build

WORKDIR /frontend

COPY package*.json ./

RUN npm install 

COPY . .

RUN npm run build

CMD ["ng", "serve", "--host", "0.0.0.0"]

