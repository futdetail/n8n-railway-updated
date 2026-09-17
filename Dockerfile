FROM alpine:latest AS alpine
FROM n8nio/n8n:latest

USER root

COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /usr/lib/libapk.so* /usr/lib/
COPY --from=alpine /lib/apk /lib/apk
COPY --from=alpine /etc/apk /etc/apk
COPY --from=alpine /var/lib/apk /var/lib/apk

RUN apk add --no-cache mysql-client

USER node
