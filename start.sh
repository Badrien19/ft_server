

# create certificat with SSL
#mkdir /etc/nginx/ssl
#openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=emma/CN=localhost"

curl -L https://github.com/FiloSottile/mkcert/releases/download/v1.1.2/mkcert-v1.1.2-linux-amd64 > mkcert
chmod +x mkcert

./mkcert -install
./mkcert localhost

mkdir /etc/nginx/ssl
mv ./localhost* /etc/nginx/ssl/

# NGINX

mkdir var/www/localhost
mv ./default.conf etc/nginx/sites-available
ln -sf /etc/nginx/sites-available/default.conf /etc/nginx/sites-enabled

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# MSQL
service mysql start
echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

# phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz
mv phpMyAdmin-4.9.0.1-all-languages var/www/localhost/phpmyadmin
mv ./config.inc.php var/www/localhost/phpmyadmin
chmod 660 /var/www/localhost/phpmyadmin/config.inc.php
chown -R www-data:www-data /var/www/localhost/phpmyadmin
service php7.3-fpm start
echo "GRANT ALL ON *.* TO 'badrien'@'localhost' IDENTIFIED BY '1234'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

#WORDPRESS
wget https://wordpress.org/latest.tar.gz
tar xvf latest.tar.gz
mkdir var/www/localhost/wordpress
cp -a wordpress/. /var/www/localhost/wordpress
mv ./wp-config.php /var/www/localhost/wordpress

# start service
service nginx start
service php7.3-fpm restart
service mysql restart


# to not close
#sleep infinity & 
#wait