wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y aspnetcore-runtime-6.0
sudo apt install unzip
sudo apt install -y ppp pppoeconf
sudo apt install -y usb-modeswitch
sudo apt install -y resolvconf 
sudo systemctl enable --now resolvconf.service
curl -SL -o wan-proxy-release.zip https://github.com/trumreup98/zip/raw/main/eg-wan-proxy-v123.zip
sudo mkdir /var/www
sudo mkdir /var/www/eg_proxy
sudo unzip wan-proxy-release.zip -d /var/www/eg_proxy
sudo chmod a+rwx /var/www/eg_proxy
sudo chmod a+rwx /var/www/eg_proxy/data/auth-settings.json
sudo chmod a+rwx /var/www/eg_proxy/data/network-settings.json
curl -SL -o add-route https://cdn.discordapp.com/attachments/1109741145807925281/1120602664728793170/add-route-p.sh
curl -SL -o remove-route https://cdn.discordapp.com/attachments/1109741145807925281/1120602852633628714/remove-route-p.sh
curl -SL -o add-route6 https://cdn.discordapp.com/attachments/1109741145807925281/1120602991280525342/add-route-p6.sh
sudo cp add-route /etc/ppp/ip-up.d/99-add-route-p
sudo cp add-route6 /etc/ppp/ipv6-up.d/99-add-route-p6
sudo cp remove-route /etc/ppp/ip-down.d/99-remove-route-p
sudo chmod +x /etc/ppp/ip-up.d/99-add-route-p
sudo chmod +x /etc/ppp/ip-down.d/99-remove-route-p
sudo chmod +x /etc/ppp/ipv6-up.d/99-add-route-p6
curl -SL -o eager-proxy.service https://github.com/trumreup98/zip/raw/main/eager-proxy-ubuntu.service
sudo cp eager-proxy.service /etc/systemd/system/eager-proxy.service
sudo systemctl enable eager-proxy.service
rm remove-route
rm add-route
rm add-route6
rm renew-ipv6-route.service
rm wan-proxy-release.zip
rm px-install.sh
history -c
