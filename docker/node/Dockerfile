FROM node:8.0.0-onbuild

RUN mkdir /src

RUN npm install nodemon -g
#RUN npm install -g sequelize-cli

WORKDIR /src
COPY entrypoint.sh /entrypoint.sh

ADD nodemon.json nodemon.json

ENTRYPOINT ["/entrypoint.sh"]
