#!/bin/bash
    # Installation du système et des paquets de base
    apt update && apt upgrade -y
    apt install -y ssh zip unzip nmap locate ncdu curl git screen dnsutils net-tools sudo lynx winbind samba

    # 1. Configuration des couleurs pour l'utilisateur root
    echo "export LS_OPTIONS='--color=auto'" >> /root/.bashrc
    echo "eval \"\$(dircolors)\"" >> /root/.bashrc
    echo "alias ls='ls \$LS_OPTIONS'" >> /root/.bashrc
    echo "alias ll='ls \$LS_OPTIONS -l'" >> /root/.bashrc

    # 2. Configuration du service /etc/nsswitch.conf
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

    # 3. Installation et configuration de Webmin
    curl -o webmin-setup-repo.sh https://raw.githubusercontent.com/webmin/webmin/master/webmin-setup-repo.sh
    # Utilisation de 'yes Y |' pour forcer la réponse Oui 
    yes Y | sh webmin-setup-repo.sh
    rm webmin-setup-repo.sh
    
    apt install webmin --install-recommends -y
    
    # 4. Installation des jeux BSD (Bonus Fun)
    apt install bsdgames -y

# Message de fin
echo ""
echo "=================================================="
echo " Configuration complète !"
echo "Webmin est installé. Accès via : https://votreIP:10000"
echo "Les jeux BSD sont installés dans /usr/games."
echo "Redémarre le serveur avec : reboot"
echo "=================================================="
