sudo find /var/www/html2/app/logs -type d -exec chmod 777 {} \;
sudo find /var/www/html2/app/logs -type f -exec chmod 777 {} \;
sudo find /var/www/html2/app/cache -type d -exec chmod 777 {} \;
sudo find /var/www/html2/app/cache -type f -exec chmod 777 {} \;
php app/console cache:clear --env=dev
php app/console cache:clear --env=prod
sudo chown -R apache /var/www/html2/

