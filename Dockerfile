FROM ubuntu:14.04
MAINTAINER Dylan Jhaveri <dylan@mustwin.com>
RUN apt-get update && apt-get install -y build-essential && apt-get install -y nodejs-legacy && apt-get install -y npm && apt-get install git-core -y && npm install -g grunt-cli bower

WORKDIR /app

ONBUILD ADD package.json /app/
ONBUILD RUN npm install
ONBUILD ADD bower.json /app/
ONBUILD RUN bower install --allow-root
ONBUILD ADD . /app

CMD [ "grunt" ]
