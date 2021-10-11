FROM node:current-alpine3.11
LABEL author="sam@stboyden.com"

WORKDIR /usr/src/stboyden.com
COPY ./scripts scripts
COPY ./public public
COPY ./src src
COPY ./package.json package.json
COPY ./rollup.config.js rollup.config.js
COPY ./yarn.lock yarn.lock
RUN apk update && apk add tree
RUN yarn install
RUN yarn build

EXPOSE 5000
CMD ["yarn", "start"]
