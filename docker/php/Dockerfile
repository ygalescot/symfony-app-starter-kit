FROM php:7.4-fpm

RUN apt-get update && apt-get install -y \
    curl \
    nano \
    git \
    unzip \
    libicu-dev \
    libzip-dev \
    g++ \
    openssl \
    pkg-config libssl-dev libcurl4-openssl-dev \
    gnupg

# Set timezone
RUN rm /etc/localtime
RUN ln -s /usr/share/zoneinfo/Europe/Paris /etc/localtime
RUN "date"

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# Install nodejs and tools
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get update && apt-get install -y nodejs

# Install Yarn
# Add Yarn repository
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# Type docker-php-ext-install to see available extensions
RUN docker-php-ext-install pdo pdo_mysql intl calendar exif zip
RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN echo 'alias sf="php bin/console"' >> ~/.bashrc
RUN echo 'alias ll="ls -l"' >> ~/.bashrc

RUN usermod -u 1000 www-data

WORKDIR /var/www/html