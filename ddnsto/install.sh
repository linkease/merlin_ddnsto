#!/bin/sh

MODULE=ddnsto
title="DDNSTO远程控制"
VERSION="2.2"
cd /
rm -rf /koolshare/init.d/S70ddnsto.sh
cp -rf /tmp/$MODULE/bin/* /koolshare/bin/
cp -rf /tmp/$MODULE/scripts/* /koolshare/scripts/
cp -rf /tmp/$MODULE/webs/* /koolshare/webs/
cp -rf /tmp/$MODULE/res/* /koolshare/res/
cp -rf /tmp/$MODULE/init.d/* /koolshare/init.d/
cp -rf /tmp/$MODULE/uninstall.sh /koolshare/scripts/uninstall_ddnsto.sh
rm -fr /tmp/ddnsto* >/dev/null 2>&1
killall ${MODULE}
chmod +x /koolshare/bin/ddnsto
chmod +x /koolshare/scripts/ddnsto_config.sh
chmod +x /koolshare/scripts/ddnsto_status.sh
chmod +x /koolshare/scripts/uninstall_ddnsto.sh
[ ! -L "/koolshare/init.d/S70ddnsto.sh" ] && ln -sf /koolshare/scripts/ddnsto_config.sh /koolshare/init.d/S70ddnsto.sh
sleep 1
dbus set ${MODULE}_version="${VERSION}"
dbus set ${MODULE}_title="${title}"
dbus set ddnsto_client_version=`/koolshare/bin/ddnsto -v`
dbus set softcenter_module_ddnsto_install=1
dbus set softcenter_module_ddnsto_name=${MODULE}
dbus set softcenter_module_ddnsto_title="ddnsto远程控制"
dbus set softcenter_module_ddnsto_description="ddnsto：koolshare小宝开发的基于http2的远程控制，仅支持远程管理路由器+nas+windows远程桌面。"
str_ddnsto_token=`dbus get ddnsto_token`
if [[ "${str_ddnsto_token}" == "" ]]; then
    dbus set ddnsto_enable="0"
    dbus remove ddnsto_password
    dbus remove ddnsto_name
else
    sh /koolshare/scripts/ddnsto_config.sh
fi
