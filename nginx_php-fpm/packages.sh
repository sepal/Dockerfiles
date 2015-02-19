#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

# Update & upgrade
apt-get update
apt-get upgrade -y

# Install required software
apt-get install --no-install-recommends -y git-core wget vim curl
apt-get install --no-install-recommends -y nginx php5-fpm php5-mysql \
php5-imagick php5-mcrypt php5-curl php5-cli php5-memcache php5-intl php5-gd \
php5-xdebug drush php-console-table php-pear

# Cleanup
apt-get clean
find /tmp /var/tmp -mindepth 2 -delete
