FROM ubuntu:latest

ENV DOCKERIZE_VERSION v0.6.1

# Install bash commands
RUN apt-get update && apt-get install -y --allow-unauthenticated --fix-missing \
curl gettext-base wget
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz
CMD /bin/bash