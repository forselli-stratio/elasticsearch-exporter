FROM justwatch/elasticsearch_exporter:1.1.0

USER root
ADD kms_utils.sh kms_utils.sh
ADD b-log.sh b-log.sh
ADD entrypoint.sh /entrypoint.sh

RUN apk update && \
    apk --no-cache add bash coreutils curl openssl vim jq gettext strace && \
    chmod +x /entrypoint.sh && \
    chmod +x /b-log.sh

ENTRYPOINT [ "/entrypoint.sh" ]