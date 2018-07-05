sudo chown -R www-data:alfonso /var/www/AodPoolWeb
sudo find /var/www/AodPoolWeb -type f -exec chmod 775 {} \;
sudo find /var/www/AodPoolWeb -type d -exec chmod 775 {} \;
