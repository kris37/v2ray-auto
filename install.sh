#!/bin/bash
source /etc/profile

service_git_conf=""
if [[ "$1" == "ss" ]]; then
		service_git_conf="ss_service_conf.json"

	elif [[ "$1" == "vmes" ]]; then
		service_git_conf="vmes_service_conf.json"

	elif [[ "$1" == "complex-vmes" ]]; then
		service_git_conf="vmes_service_conf.json"
	else
		service_git_conf="vmes_service_conf.json"
fi


V2RAY_HOME="/opt/v2ray"
mkdir "${V2RAY_HOME}"
cd "${V2RAY_HOME}"


# 密码生成函数
function randomPasswd()
{
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w ${1:-32} | head -n 1
}
ENCRYPTION="aes-128-gcm"
SERVICE_IP=`ip route get 1 | awk '{print $NF;exit}'`
#LOCAL_IP=`hostname -I | cut -d' ' -f1`
UUID=`cat /proc/sys/kernel/random/uuid`
V2RAY_PASSWORD=$(randomPasswd 32)

echo ${UUID} >> "${V2RAY_HOME}/v2ray.password"
echo ${V2RAY_PASSWORD} > "${V2RAY_HOME}/v2ray.password"
echo ${SERVICE_IP} >> "${V2RAY_HOME}/v2ray.password"
echo ${ENCRYPTION} >> "${V2RAY_HOME}/v2ray.password"

CONF_PATH="${V2RAY_HOME}/config.json"

yum install -y git
git clone https://github.com/kris37/v2ray-auto.git


mv "v2ray-auto/${service_git_conf}" ${CONF_PATH}
sed -i 's/ENCRYPTION/${ENCRYPTION}/g' ${CONF_PATH}
sed -i 's/SERVICE_IP/${SERVICE_IP}/g' ${CONF_PATH}
sed -i 's/UUID/${UUID}/g' ${CONF_PATH}
sed -i 's/PASSWD/${V2RAY_PASSWORD}/g' ${CONF_PATH}

#docker /usr/bin/v2ray/v2ray -test -config "${CONF_HOME}"

# echo "downloading install shell....."
# wget https://install.direct/go.sh
# bash go.sh

#install docker
/bin/bash docker-install.sh

docker pull v2ray/official
docker run -d --name v2ray -v "${V2RAY_HOME}":/etc/v2ray -p 10037:10037 v2ray/official v2ray -config=/etc/v2ray/config.json






