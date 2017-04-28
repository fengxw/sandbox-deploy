FROM debian:8
MAINTAINER ALBERT FENG <feng235ping@gmail.com>

# Update distribution
COPY data/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install tools
RUN apt-get install vim cron wget git -y

# Install php5 and extensions
RUN  apt-get install -y php5-fpm php5-mysql php5-curl php5-common php5-redis php5-gd

# Copy composer on system and install it globally
COPY data/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

# Copy php-fpm conf
COPY data/www.conf /etc/php5/fpm/pool.d/www.conf

# Copy cron jobs
COPY data/crontab /etc/crontab

# Copy startup script
COPY data/entrypoint.sh /root/entrypoint.sh
RUN chown root:root /root/entrypoint.sh
RUN chmod +x /root/entrypoint.sh

# Clear image
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

WORKDIR /var/www
VOLUME /var/www
EXPOSE 9000

# Run startup script
ENTRYPOINT ["/root/entrypoint.sh"]
