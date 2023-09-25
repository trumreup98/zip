curl -SL -o wan-proxy-release.zip https://github.com/trumreup98/zip/raw/main/eg-wan-proxy-v127-update.zip
sudo unzip wan-proxy-release.zip -d /var/www/eg_proxy
sudo systemctl restart eager-proxy.service
rm wan-proxy-release.zip
rm px-install.sh
history -c
