#! /bin/sh

ddnsto_status=`ps | grep -w ddnsto | grep -cv grep`
ddnsto_pid=`ps | grep -w ddnsto | grep -v grep | awk '{print $1}'`
ddnsto_version=`/koolshare/bin/ddnsto -v`
if [ "$ddnsto_status" == "2" ];then
	echo ddnsto  $ddnsto_version  进程运行正常！（PID：$ddnsto_pid） > /tmp/.ddnsto.log
else
	echo ddnsto  $ddnsto_version 【警告】：进程未运行！ > /tmp/.ddnsto.log
fi
echo XU6J03M6 >> /tmp/.ddnsto.log
sleep 2
rm -rf /tmp/.ddnsto.log