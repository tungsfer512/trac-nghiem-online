FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive
ENV DEBCONF_NONINTERACTIVE_SEEN=true

RUN apt-get update -y
RUN apt-get install -y apache2 php libapache2-mod-php unzip php-cli nano sudo certbot libapache2-mod-xsendfile php-fpm
RUN apt-get install -y curl wget php-imagick php-curl php-bz2 php-gd php-intl php-mbstring php-mysql php-zip php-apcu php-xml php-ldap php-dom php-simplexml
RUN apt install -y apache2-utils 
RUN apt install -y apt-transport-https lsb-release ca-certificates curl dirmngr gnupg
RUN apt-get install -y nginx php unzip php-cli nano sudo certbot php-fpm
RUN apt-get update -y
RUN apt-get upgrade -y

WORKDIR /var/www/html
RUN rm -rf /var/www/html/*
# COPY ./resource /var/www/html/

RUN chmod -R 777 /var/www/
RUN a2enmod rewrite
RUN service apache2 restart

EXPOSE 80
CMD ["/usr/sbin/apachectl", "-D", "FOREGROUND"]