#!/bin/bash

for filename in pgpool.conf pool_hba.conf pool_passwd
do
  [ -f /etc/pgpool/${filename} ] && cp /etc/pgpool/${filename} /etc/pgpool2/${filename}
done

for param in num_init_children max_pool child_life_time child_max_connections connection_life_time client_idle_limit
do
  envvar=$(echo ${param} | tr a-z A-Z)
  [ ! -z "${!envvar}" ] && sed -i 's/'$param' =.*/'$param' = '${!envvar}'/g' /etc/pgpool2/pgpool.conf
done

exec "$@"