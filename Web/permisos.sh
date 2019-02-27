export user="alfonso"

sudo setfacl -R -m u:www-data:rwX -m u:$user:rwX app/cache app/logs
sudo setfacl -dR -m u:www-data:rwx -m u:$user:rwx app/cache app/logs


