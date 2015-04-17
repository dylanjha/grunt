FROM ubuntu:14.04
MAINTAINER Dylan Jhaveri <dylan@mustwin.com>

RUN apt-get update && \
  apt-get install -y \
  build-essential \
  git-core \
  nodejs-legacy \
  npm \
  && npm install -g grunt-cli bower

RUN echo '#!/bin/sh' > /bin/run-grunt
RUN echo 'npm install' >> /bin/run-grunt
RUN echo 'bower install --allow-root' >> /bin/run-grunt
RUN echo 'grunt' >> /bin/run-grunt
RUN chmod a+x /bin/run-grunt

WORKDIR /app

ONBUILD ADD package.json /app/package.json
ONBUILD ADD bower.json /app/bower.json

ONBUILD ADD . /app

CMD [ "/bin/run-grunt" ]
