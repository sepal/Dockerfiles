#!/bin/sh

# Install drush
pear channel-discover pear.drush.org
pear install drush/drush

# Download drupal to the /var/www folder.
drush dl drupal --destination=/var --drupal-project-rename=www -y

# Create a settings file.
cp /var/www/sites/default/default.settings.php /var/www/sites/default/settings.php

chown -R www-data:www-data /var/www
