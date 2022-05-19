#!/bin/bash 
###############################################################################
# File: get-server-info.sh                                                    #
# Author: Cristian Segura <cristian.segura.lepe@gmail.com>                    #
# Creation date: Tue May  3 16:11:44 UTC 2022                                 #
# Usage: Get Linux Server Information                                         #
###############################################################################

# DELME
rm pt*

HOSTNAME=$(hostname)
TIMESTAMP=$(date +%Y%m%d%H%M%S)
LOGFILE=${HOSTNAME}-${TIMESTAMP}-server-info.lst
rm $LOGFILE
touch $LOGFILE

echo "[HOST]============================================================="    >> $LOGFILE
echo ""						>> $LOGFILE
echo "hostname=\"$(hostname)\""			>> $LOGFILE
echo "os-name=\"$(cat /etc/issue)\""		>> $LOGFILE
echo "os-name=\"$(cat /etc/redhat-release)\""	>> $LOGFILE
echo ""						>> $LOGFILE
echo "=[KERNEL]============================================================="    >> $LOGFILE
echo ""						>> $LOGFILE
echo "kernel-version=\"$(uname -r)\""		>> $LOGFILE
echo "kernel-version-full=\"$(uname -a)\""	>> $LOGFILE
echo ""						>> $LOGFILE
echo "=[PROCESSOR]============================================================="			>> $LOGFILE
echo ""													>> $LOGFILE
echo "cpu-vcpu-number=$(cat /proc/cpuinfo | grep -i "model name" | wc -l)"				>> $LOGFILE
echo "cpu-model-name=\"$(cat /proc/cpuinfo | grep -i "model name" | tail -n 1 | cut -d ":" -f 2)\""	>> $LOGFILE
echo ""             >> $LOGFILE
echo "=[MEMORY]============================================================="	>> $LOGFILE
echo "[memory-gigabytes]"	>> $LOGFILE
free -g				>> $LOGFILE
echo ""				>> $LOGFILE
echo "[memory-megabytes]"	>> $LOGFILE
free -m				>> $LOGFILE
echo ""				>> $LOGFILE
echo "=[STORAGE]============================================================="	>> $LOGFILE
echo "[storage-partitions]"	>> $LOGFILE
df -hl				>> $LOGFILE
echo ""				>> $LOGFILE
echo "=[SOFTWARE]============================================================="    >> $LOGFILE
echo "[software-process-snapshot]"	>> $LOGFILE
dpkg --list				>> $LOGFILE
echo ""             >> $LOGFILE
echo "=[PROCESS]============================================================="    >> $LOGFILE
top -bn1            >> $LOGFILE
echo ""             >> $LOGFILE
ss -ntplu	    >> $LOGFILE
echo ""             >> $LOGFILE
echo "=[NETWORKING]============================================================="    >> $LOGFILE
echo "[nic cards]"	>> $LOGFILE
ip addr			>> $LOGFILE
echo ""			>> $LOGFILE
echo "[routes]"		>> $LOGFILE
ip route		>> $LOGFILE

