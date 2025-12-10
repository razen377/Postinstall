#!/bin/bash
apt update && apt upgrade -y
apt install -y ssh zip unzip nmap locate ncdu curl git screen dnsutils net-tools sudo lynx winbind samba

# Configuration des couleurs pour root
echo "export LS_OPTIONS='--color=auto'" >> /root/.bashrc
echo "eval \"\$(dircolors)\"" >> /root/.bashrc
echo "alias ls='ls \$LS_OPTIONS'" >> /root/.bashrc
echo "alias ll='ls \$LS_OPTIONS -l'" >> /root/.bashrc

# Configuration de nsswitch.conf
rm -f /etc/nsswitch.conf
echo "# /etc/nsswitch.conf" > /etc/nsswitch.conf
echo "passwd: files systemd winbind" >> /etc/nsswitch.conf
echo "group: files systemd winbind" >> /etc/nsswitch.conf
echo "shadow: files systemd" >> /etc/nsswitch.conf
echo "gshadow: files systemd" >> /etc/nsswitch.conf
echo "hosts: files dns wins" >> /etc/nsswitch.conf
echo "networks: files" >> /etc/nsswitch.conf
echo "protocols: db files" >> /etc/nsswitch.conf
echo "services: db files" >> /etc/nsswitch.conf
echo "ethers: db files" >> /etc/nsswitch.conf
echo "rpc: db files" >> /etc/nsswitch.conf
echo "netgroup: nis" >> /etc/nsswitch.conf

# Message de fin
echo ""
echo "=================================================="
echo "✅ Configuration complète !"
echo "Redémarre le serveur avec : reboot"
echo "=================================================="
