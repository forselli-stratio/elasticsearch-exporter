FROM alpine:latest

USER root
ADD kms_utils.sh kms_utils.sh
ADD b-log.sh b-log.sh
ADD entrypoint.sh /entrypoint.sh
ADD elasticsearch_exporter /bin/elasticsearch_exporter

RUN apk update && \
    apk --no-cache add bash curl vim jq strace && \
    chmod +x /bin/elasticsearch_exporter && \
    chmod +x /entrypoint.sh && \
    chmod +x /b-log.sh

ENTRYPOINT [ "/entrypoint.sh" ]
