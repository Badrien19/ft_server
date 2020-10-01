FROM debian:buster

MAINTAINER Badrien <badrien@student.s19.fr>

RUN apt-get update && \
apt-get install -y nginx && \
apt-get install -y wget && \
apt-get install -y curl && \
apt-get install -y openssl && \
apt-get install -y mariadb-server mariadb-client && \
apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline && \
apt-get install -y php-mbstring php-zip php-gd && \
apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

#RUN mkdir var/www/localhost
#
#COPY ./nginx.conf /etc/nginx/sites-available
#COPY ./index.html /var/www/localhost
#
#RUN mkdir /etc/nginx/ssl
#RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42 School/OU=emma/CN=localhost"

#RUN rm /etc/nginx/sites-enabled/default && \
#ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled && \
#chown -R www-data /var/www/* && \
#chmod -R 755 /var/www/*


#COPY nginx.conf /etc/nginx/sites-available/ft_server.com
#COPY index.html /etc/www/html/
#RUN ln -s /etc/nginx/sites-available/ft_server.com /etc/nginx/sites-enabled/ft_server.com
#ENTRYPOINT /home/docker/script/service_start.sh
#WORKDIR /home/docker
COPY ./default.conf .
COPY ./start.sh .
COPY ./wp-config.php .
COPY ./config.inc.php .

EXPOSE 80
EXPOSE 443

CMD ["bash"]