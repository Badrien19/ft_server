FROM debian:buster

MAINTAINER Badrien <badrien@student.s19.fr>

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install -y wget
RUN apt-get install -y openssl
RUN apt-get install -y mariadb-server mariadb-client
RUN apt-get install -y php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline
RUN apt-get install -y php-mbstring php-zip php-gd
RUN apt-get install -y php-curl php-gd php-intl php-mbstring php-soap php-xml php-xmlrpc php-zip

RUN echo "test" 

COPY nginx.conf /etc/nginx/sites-available/ft_server.com
COPY index.html /etc/www/html/
#RUN ln -s /etc/nginx/sites-available/ft_server.com /etc/nginx/sites-enabled/ft_server.com
#ENTRYPOINT /home/docker/script/service_start.sh
#WORKDIR /home/docker

COPY ./start.sh ./
CMD bash ./start.sh
EXPOSE 80