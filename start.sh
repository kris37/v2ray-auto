#!/bin/bash
source /etc/profile
#service in (ss,vmes,complex-vmes)
service="vmes"
echo "install ${service} on /opt/v2ray "
wget https://raw.githubusercontent.com/kris37/v2ray-auto/master/install.sh
/bin/bash install.sh ${service}
