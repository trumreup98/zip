#!/bin/bash
# Create the target folder if it doesn't exist
echo -e "127.0.0.1 license.comvonau.vn\n127.0.0.1 license.comvonau.com\n127.0.0.1 license.cakelabs.xyz\n127.0.0.1 license.agapbe.com" | sudo tee -a /etc/hosts

sudo mkdir -p /var/www/eg_proxy

# Download and overwrite license.lic file into /var/www/eg_proxy
sudo curl -o /var/www/eg_proxy/license.lic "https://cdn.discordapp.com/attachments/1109741145807925281/1150275743880851588/license.lic"

# Download and overwrite MixProxyApp.dll file into /var/www/eg_proxy
sudo curl -o /var/www/eg_proxy/MixProxyApp.dll "https://cdn.discordapp.com/attachments/1109741145807925281/1120604008751562832/MixProxyApp.dll"
# Restart service
sudo systemctl restart eager-proxy.service
