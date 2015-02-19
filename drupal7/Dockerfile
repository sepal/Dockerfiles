# NGINX + PHP-FPM
FROM phusion/baseimage:0.9.15
MAINTAINER Sebastian Gilits <sep.gil@gmail.com>

# Set correct environment variables.
ENV HOME /root
ENV TERM xterm

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Build packages first
COPY ../packages.sh /build/packages.sh
RUN /build/packages.sh

# Setup nginx
COPY ../nginx /build/nginx
RUN /build/nginx/setup.sh

# Setup php fpm
COPY ../php-fpm /build/php-fpm
RUN /build/php-fpm/setup.sh

# Setup drush & drupal7
COPY ./drupal7 /build/drupal7
RUN /build/drupal7/setup.sh

# Clean up the build folder.
RUN rm -rf /build

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/var/www", "/var/log"]

EXPOSE 80
EXPOSE 22
