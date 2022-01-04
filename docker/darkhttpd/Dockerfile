FROM alpine:latest

RUN apk update --no-cache                    \
    && apk add --update --no-cache darkhttpd \
    && mkdir -p /home/www

EXPOSE 6600

WORKDIR "/home/www"
ENTRYPOINT ["darkhttpd", ".", "--port", "6600"]
