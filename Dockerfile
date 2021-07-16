FROM node:16-alpine as nodejs

ADD . /app

WORKDIR  /app

RUN npm install

WORKDIR  /app

ENTRYPOINT [ "npm", "run", "serve" ,"--", "--build", "--port", "80" ]