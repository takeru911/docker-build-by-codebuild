FROM alpine:3.4

RUN apk --update add python ruby && rm -rf /var/cache/apk/*
