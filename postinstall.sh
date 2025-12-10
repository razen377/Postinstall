#!/bin/bash
    # Installation du système et des paquets
    apt update && apt upgrade -y
    apt install -y ssh zip unzip nmap locate ncdu curl git screen dnsutils net-tools sudo lynx winbind samba

    # 1. Configuration des couleurs pour l'utilisateur root (/root/.bashrc)
    # Ajout des options et des alias de coloration
    echo "export LS_OPTIONS='--color=auto'" >> /root/.bashrc
    echo "eval \"\$(dircolors)\"" >> /root/.bashrc
    echo "alias ls='ls \$LS_OPTIONS'" >> /root/.bashrc
    echo "alias ll='ls \$LS_OPTIONS -l'" >> /root/.bashrc

    # 2. Configuration du service de noms (/etc/nsswitch.conf)
    # Supprime l'ancien fichier
    rm -f /etc/nsswitch.conf
    
    # Recréation du fichier ligne par ligne avec ECHO
    # La première ligne utilise > pour créer/écraser le fichier
    echo "# /etc/nsswitch.conf" > /etc/nsswitch.conf
    # Les lignes suivantes utilisent >> pour ajouter
    echo "passwd:          files systemd winbind" >> /etc/nsswitch.conf
    echo "group:           files systemd winbind" >> /etc/nsswitch.conf
    echo "shadow:          files systemd" >> /etc/nsswitch.conf
    echo "gshadow:         files systemd" >> /etc/nsswitch.conf
    echo "hosts:           files dns wins" >> /etc/nsswitch.conf
    echo "networks:        files" >> /etc/nsswitch.conf
    echo "protocols:       db files" >> /etc/nsswitch.conf
    echo "services:        db files" >> /etc/nsswitch.conf
    echo "ethers:          db files" >> /etc/nsswitch.conf
    echo "rpc:             db files" >> /etc/nsswitch.conf
    echo "netgroup:        nis" >> /etc/nsswitch.conf


# Message de fin
echo ""
echo "=================================================="
echo " Configuration complète !"
echo "Redémarre le serveur avec : reboot"
echo "=================================================="
