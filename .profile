echo "Nyni probehne update instalacnich a konfiguracnich skriptu..."
sleep 2
cd /root/jitsi-init-debian/
git fetch --all
git reset --hard
git pull 
chmod +x *.sh
sleep 3
clear
./jitsi-afterlogin.sh
