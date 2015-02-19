#!/bin/sh

# Install drush
pear channel-discover pear.drush.org
pear install drush/drush

# Download drupal to the /var/www folder.
drush dl drupal --destination=/var --drupal-project-rename=www -y

# Create a settings file based on the enviroment variables.
$settings=/var/www/sites/default/settings.php
touch $settings
chmod a+w $settings

# Set some default values.
if [ -z $MYSQL_DATABASE]; then
    export MYSQL_DATABASE=""
fi

if [ -z $MYSQL_USER]; then
    export MYSQL_USER=$MYSQL_DATABASE
fi

if [ -z $MYSQL_PASSWORD]; then
    export MYSQL_PASSWORD=""
fi

if [ -z $MYSQL_PORT_3306_TCP_ADDR]; then
    export MYSQL_PORT_3306_TCP_ADDR="localhost"
fi

# Write the settings into the settings.php
cat <<EOT >> $settings
\$database['default']['default'] = array(
  'driver' => 'mysql',
  'database' => '$MYSQL_DATABASE',
  'username' => '$MYSQL_USER',
  'password' => '$MYSQL_PASSWORD',
  'host' => '$MYSQL_PORT_3306_TCP_ADDR',
);
EOT
