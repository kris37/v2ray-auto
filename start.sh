#!/bin/bash
source /etc/profile
#service in (ss,vmes,complex-vmes)
service="vmes"

echo "install ${service}"
/bin/bash install.sh ${service}

