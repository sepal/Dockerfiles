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

# Copy the setup files to a build folder
COPY nginx_php-fpm/packages.sh /build/packages.sh
COPY nginx_php-fpm/nginx /build/nginx
COPY nginx_php-fpm/php-fpm /build/php-fpm
COPY ./drupal7 /build/drupal7

RUN chmod -R +x /build

RUN ls -l /build/
RUN /build/packages.sh
RUN /build/nginx/setup.sh
RUN /build/php-fpm/setup.sh
RUN /build/drupal7/setup.sh

# Clean up the build folder.
RUN rm -rf /build

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

VOLUME ["/var/www", "/var/log"]

EXPOSE 80
EXPOSE 22
