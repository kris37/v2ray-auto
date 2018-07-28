## 依赖于docker的v2ray 自动安装脚本
```text
 目前只支持centos7 自动安装
 脚本很水，仅供个人使用.
```

## quickStart

```bash
wget https://raw.githubusercontent.com/kris37/v2ray-auto/master/start.sh
/bin/bash start.sh
```
* 默认安装在 ```/opt/v2ray``` 目录下
* 密码配置等信息在 ```/opt/v2ray/v2ray.passwd```
* 如果要修改 加密方式和端口等配置，请 fork 后修改install.sh的 EXPORT 等变量的值,git地址也注意变更

## 备注说明
* streamSettings.header.type in (utp、srtp、wechat-video 或者 none default wechat-video)
* todo