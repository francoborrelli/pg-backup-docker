FROM alpine:latest

LABEL maintainer="Franco Borrelli <francoborrelli96@gmail.com>"

RUN echo 'http://dl-cdn.alpinelinux.org/alpine/edge/testing' >> '/etc/apk/repositories'

RUN apk --no-cache update && \
  apk --no-cache add ca-certificates groff less python3 py3-pip postgresql-client mailutils swaks && \
  pip3 --no-cache-dir install awscli && \
  rm -rf /var/cache/apk/*

RUN mkdir -p /backups
ADD backup.sh /usr/bin/backup
RUN chmod +x /usr/bin/backup

RUN ln -s /usr/bin/backup /etc/periodic/daily

#RUN ln -s /usr/bin/backup /etc/periodic/15min


CMD [ "crond", "-l", "2", "-f" ]
