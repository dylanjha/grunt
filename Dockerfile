FROM ubuntu:14.04
MAINTAINER Dylan Jhaveri <dylan@mustwin.com>

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  git-core \
  nodejs-legacy \
  npm \
  npm install -g grunt-cli bower

WORKDIR /app

ONBUILD ADD package.json /app/package.json
ONBUILD RUN npm install
ONBUILD ADD bower.json /app/bower.json
ONBUILD RUN bower install --allow-root

ONBUILD ADD . /app

CMD [ "grunt", "serve" ]

