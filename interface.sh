#!/bin/bash

# Detect all network interfaces except loopback (lo)
interfaces=$(ls /sys/class/net | grep -v lo)

# Backup the original /etc/network/interfaces file
sudo cp /etc/network/interfaces /etc/network/interfaces.bak

# Initialize the new interfaces file with the content for the loopback interface
echo "auto lo" > /tmp/new_interfaces
echo "iface lo inet loopback" >> /tmp/new_interfaces
echo "" >> /tmp/new_interfaces

# Add configurations for each detected interface
for interface in $interfaces; do
    echo "auto $interface" >> /tmp/new_interfaces
    echo "iface $interface inet dhcp" >> /tmp/new_interfaces
    echo "" >> /tmp/new_interfaces
done

# Replace the original /etc/network/interfaces file with the new one
sudo mv /tmp/new_interfaces /etc/network/interfaces

# Restart the networking service to apply changes (Optional)
#sudo /etc/init.d/networking restart
