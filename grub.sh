#!/bin/bash

# Update GRUB to ensure that the network interface names do not change
sudo sed -i 's/GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0"/g' /etc/default/grub

# Update the GRUB configuration
sudo update-grub
sudo reboot
