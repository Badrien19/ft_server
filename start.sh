

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

# start service
service nginx start


# to not close
#sleep infinity & 
#wait