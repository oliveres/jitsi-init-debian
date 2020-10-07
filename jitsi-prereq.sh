#!/bin/bash
userdel jitsiuser
apt install apt-transport-https mc curl gpg lsb-release -y
# wget https://www.lemo.cloud/download/authorized_keys
# mkdir -p /root/.ssh
# mv authorized_keys /root/.ssh/
# /etc/init.d/ssh restart
curl https://download.jitsi.org/jitsi-key.gpg.key | sh -c 'gpg --dearmor > /usr/share/keyrings/jitsi-keyring.gpg' 
echo 'deb [signed-by=/usr/share/keyrings/jitsi-keyring.gpg] https://download.jitsi.org stable/' | tee /etc/apt/sources.list.d/jitsi-stable.list > /dev/null
