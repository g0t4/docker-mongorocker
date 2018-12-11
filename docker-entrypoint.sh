#!/bin/bash
echo "Injecting environment variables into config files"

# Copy NGINX config and inject the hostname from NGINX_HOSTNAME
cp /tmp/rockmongo.conf /etc/nginx/sites-available/default
sed -i -e "s/%%%NGINX_HOSTNAME%%%/${NGINX_HOSTNAME}/g" /etc/nginx/sites-available/default

# Copy rockmongo config and inject config from environment variables
cp /tmp/config.php /app/config.php
sed -i -e "s/%%%MONGO_SERVER%%%/${MONGO_SERVER}/g" /app/config.php
sed -i -e "s/%%%MONGO_PORT%%%/${MONGO_PORT}/g" /app/config.php
sed -i -e "s/%%%MONGO_DATABASE%%%/${MONGO_DATABASE}/g" /app/config.php
sed -i -e "s/%%%MONGO_AUTH%%%/${MONGO_AUTH}/g" /app/config.php
sed -i -e "s/%%%MONGO_USERNAME%%%/${MONGO_USERNAME}/g" /app/config.php
sed -i -e "s/%%%MONGO_PASSWORD%%%/${MONGO_PASSWORD}/g" /app/config.php
sed -i -e "s/%%%ROCKMONGO_AUTH%%%/${ROCKMONGO_AUTH}/g" /app/config.php
sed -i -e "s/%%%ROCKMONGO_USER%%%/${ROCKMONGO_USER}/g" /app/config.php
sed -i -e "s/%%%ROCKMONGO_PASSWORD%%%/${ROCKMONGO_PASSWORD}/g" /app/config.php

sed -i -e "s|\$url = \$_SERVER|\$url = '${ROCKMONGO_BASE_URI}'.\$_SERVER|" /app/app/lib/ext/RExtController.php /app/app/funcs/render.php
sed -i -e "s|\$this->path = \$_SERVER|\$this->path = '${ROCKMONGO_BASE_URI}'.\$_SERVER|" /app/app/lib/page/RPage.php

service php5-fpm start 
# exec so nginx is PID 1, can receive commands signals sent to container
exec nginx "$@"
