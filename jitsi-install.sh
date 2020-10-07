#!/bin/bash
ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
echo "Zadejte domenu 3. urovne pro tento server (napriklad jitsi.vasefirma.cz)"
read hostname
host=${hostname%.*.*}
echo $'127.0.0.1	localhost\n'$ip'	'$hostname'	'$host > /etc/hosts
hostnamectl set-hostname $host
echo "Nyni si zmente heslo uzivatele root"
passwd
apt update
apt install jitsi-meet -y
echo -e "letsencrypt@lemo.cloud" | /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
echo "Instalace je dokoncena. Server bude restartovan."
sleep 8
reboot now

