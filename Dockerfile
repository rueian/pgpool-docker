FROM debian:stretch-slim

RUN apt-get update && \
    apt-get install -y wget gnupg && \
    echo "deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main" > /etc/apt/sources.list.d/pgdg.list && \
    wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - && \
    apt-get update && \
    apt-get install --no-install-recommends -y pgpool2 && \
    apt-get remove -y --auto-remove wget gnupg && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/pgpool/

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["/usr/sbin/pgpool", "-n"]