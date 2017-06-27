FROM debian:stretch

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y apt-utils openssl curl git htop unzip
RUN apt-get install -y --fix-missing apache2 php7.0 php7.0-xml php7.0-intl php7.0-mbstring php7.0-pdo php7.0-mysql php7.0-curl

RUN a2enmod expires rewrite

RUN curl 'https://getcomposer.org/composer.phar' > /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

RUN echo "#!/bin/bash" > /usr/bin/apache2-foreground
RUN echo "set -e" >> /usr/bin/apache2-foreground
RUN echo "rm -f /usr/local/apache2/logs/httpd.pid" >> /usr/bin/apache2-foreground
RUN echo "touch /var/log/apache.log && chmod go+rw /var/log/apache.log"  >> /usr/bin/apache2-foreground
RUN echo "touch /var/log/apache.error.log && chmod go+rw /var/log/apache.error.log"  >> /usr/bin/apache2-foreground
RUN echo "tail -f /var/log/apache.log -f /var/log/apache.error.log&" >> /usr/bin/apache2-foreground
RUN echo "apachectl -e info -DFOREGROUND" >> /usr/bin/apache2-foreground
RUN chmod +x /usr/bin/apache2-foreground

RUN rm -Rf /etc/apache2/sites-enabled/000-default.conf

COPY ./source/web /var/www/html
COPY ./docker/web/config/php.ini /usr/local/etc/php/php.ini
COPY ./docker/web/config/apache-host.conf /etc/apache2/sites-enabled/apache-host.conf

WORKDIR /var/www/html

RUN composer install --no-interaction --optimize-autoloader

CMD ["apache2-foreground"]
