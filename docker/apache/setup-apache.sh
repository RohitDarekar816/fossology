#!/bin/bash
# Apache setup script for FOSSology
# This script configures Apache to serve FOSSology correctly

# Disable default site
a2dissite 000-default.conf

# Copy FOSSology configuration
cp /tmp/fossology.conf /etc/apache2/sites-available/fossology.conf

# Enable FOSSology site
a2ensite fossology.conf

# Set proper permissions
chown -R www-data:www-data /usr/local/share/fossology/www/ui/
chmod -R 755 /usr/local/share/fossology/www/ui/

# Reload Apache
service apache2 reload