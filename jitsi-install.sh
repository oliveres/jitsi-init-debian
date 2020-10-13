#!/bin/bash
curl https://download.jitsi.org/jitsi-key.gpg.key | sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg' 
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null
apt update
apt upgrade -y

ip=$(ip route get 8.8.8.8 | awk -F"src " 'NR==1{split($2,a," ");print a[1]}')
echo "**********************************************************"
echo "* Vita vas instalace Jitsi serveru beziciho v LEMO Cloud *"
echo "**********************************************************"
sleep 1
echo "Zadejte domenu 3. urovne pro tento server (napriklad jitsi.vasefirma.cz)"
read hostname
host=${hostname%.*.*}
echo $'127.0.0.1	localhost\n'$ip'	'$hostname'	'$host > /etc/hosts
hostnamectl set-hostname $host
echo "Kontroluji jestli pro existuje DNS zaznam $hostname a smeruje na IP adresu $ip"
dnscheck=`dig +short A $hostname @8.8.8.8`
if [ ! "$dnscheck" = "$ip" ]
then
    echo "DNS zaznam neexstuje, neodpovida IP, nebo jeste neni rozsiren v systemu DNS"
    echo "Instalace prerusena. Jakmile bude DNS zaznam existovat, spuste instalaci znovu"
    exit 1
fi 
echo "DNS zaznam je v poradku, nyni bude zahajena samotna instalace. V jejim prubehu jeste jednou zadate $hostname"
sleep 5
# apt update
# apt install jitsi-meet -y
# echo -e "letsencrypt@lemo.cloud" | /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh
echo "Instalace je dokoncena. Server bude restartovan."
sleep 1
# reboot now
