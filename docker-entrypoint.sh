#!/bin/bash -e

echo 'Setting pgpool.conf'

{
	IFS=', ' read -r -a array <<< $BACKEND_HOSTNAME

	for index in "${!array[@]}"
	do
		echo ""
	  echo "backend_hostname$index = '${array[index]}'"
		echo "backend_port$index = 5432"
		echo "backend_weight$index = 1"
		echo "backend_data_directory$index = '/data$index'"
		echo "backend_flag$index = 'ALLOW_TO_FAILOVER'"
	done

} >> /etc/pgpool.conf

echo 'Start pgpool'
exec "$@"
