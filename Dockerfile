FROM php:7.2-fpm
RUN apt-get update && apt-get install -y \
    git \
    libzip-dev \
    zip \
    unzip
RUN apt-get install -y libpng-dev    
RUN docker-php-ext-configure zip --with-libzip
RUN docker-php-ext-install pdo_mysql zip
RUN docker-php-ext-install gd
RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer
