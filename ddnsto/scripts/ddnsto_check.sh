#!/bin/sh
eval `dbus export ddnsto`
source /koolshare/scripts/base.sh

if [ "${ddnsto_enable}"x = "1"x ];then
    ddnsto_status=`ps | grep -w ddnsto | grep -cv grep`
    if [ "${ddnsto_status}"x != "2"x ];then
        sh /koolshare/scripts/ddnsto_config.sh
    fi
fi
