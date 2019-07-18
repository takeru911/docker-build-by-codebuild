FROM alpine:3.4

RUN apk --update add python && rm -rf /var/cache/apk/*
