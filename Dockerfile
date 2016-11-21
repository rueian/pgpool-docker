FROM postgres:9.6

RUN apt-get update && apt-get install -y pgpool2 && rm -rf /var/lib/apt/lists/*

COPY pcp.conf /etc/pcp.conf
COPY pgpool.conf /etc/pgpool.conf
COPY pool_hba.conf /etc/pool_hba.conf
COPY docker-entrypoint.sh /

EXPOSE 5433 9898

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["pgpool", "-F", "/etc/pcp.conf", "-f", "/etc/pgpool.conf", "-a", "/etc/pool_hba.conf", "-n"]
