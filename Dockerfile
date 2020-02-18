FROM ruby:2-alpine

ARG VERSION=0.7.1

RUN apk add --no-cache sqlite-dev

RUN apk add --no-cache --virtual .build-deps alpine-sdk \
  && gem install mailcatcher -v $VERSION \
  && apk del .build-deps

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground"]
CMD ["--ip", "0.0.0.0"]
