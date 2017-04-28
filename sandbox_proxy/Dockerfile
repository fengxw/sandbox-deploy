FROM nginx:1.10
MAINTAINER ALBERT FENG <feng235ping@gmail.com>

# Update distribution
COPY data/sources.list /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

# Install tools
RUN apt-get install vim -y

# Clear image
RUN apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false

WORKDIR /var/www
VOLUME /var/www
