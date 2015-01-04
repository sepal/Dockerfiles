#!/bin/sh

# Install drush
pear channel-discover pear.drush.org
pear install drush/drush

# Install drupal to the /var/www folder
drush dl drupal --destination=/var --drupal-project-rename=www -y
