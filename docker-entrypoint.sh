#!/bin/sh

for filename in pgpool.conf pool_hba.conf pool_passwd
do
  [ -f /etc/pgpool/${filename} ] && cp /etc/pgpool/${filename} /etc/pgpool2/${filename}
done

exec "$@"