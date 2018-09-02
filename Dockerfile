FROM php:7.2.9
RUN apt-get update && apt-get install libzip-dev -y
RUN apt-get install vim -y #debug
RUN pecl install zip && echo "extension=zip.so" >> /usr/local/etc/php/conf.d/docker-php-ext-sodium.ini
RUN curl -sS https://getcomposer.org/installer | php
RUN mv composer.phar /usr/local/bin/composer &&chmod +x /usr/local/bin/composer && composer global require "laravel/installer"
RUN export PATH=/root/.composer/vendor/bin/:$PATH
RUN mkdir laravel.d && chmod +wx laravel.d
#RUN /root/.composer/vendor/bin/laravel new laravel.d/TestApp

EXPOSE 80
#CMD ["php", "artisan", "serve"]
