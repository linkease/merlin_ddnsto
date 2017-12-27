#!/bin/sh
eval `dbus export ddnsto_`
source /koolshare/scripts/base.sh
MODULE=ddnsto
cd /tmp
killall ddnsto || true
rm -rf /koolshare/init.d/S70ddnsto.sh
rm -rf /koolshare/bin/ddnsto
rm -rf /koolshare/res/icon-ddnsto.png
rm -rf /koolshare/res/ddnsto_check.html
rm -rf /koolshare/scripts/ddnsto_config.sh
rm -rf /koolshare/scripts/ddnsto_status.sh
rm -rf /koolshare/webs/Module_ddnsto.asp
rm -fr /tmp/ddnsto*
cru d ddnsto_check >/dev/null 2>&1
dbus remove __event__onnatstart_ddnsto
values=`dbus list ddnsto_ | cut -d "=" -f 1`

for value in $values
do
dbus remove $value
done
rm -f /koolshare/scripts/uninstall_ddnsto.sh
