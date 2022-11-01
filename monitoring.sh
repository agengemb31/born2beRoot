#!/bin/bash

Archi=`uname -srvmo`
pCPU=`grep 'physical id' /proc/cpuinfo | wc -l`
vCPU=`grep 'processor' /proc/cpuinfo | wc -l`

nbUserLog=`who | wc -l`
ipAdress=`hostname -I | awk '{print $1}'`
macAdress=`ip link | grep 'link/ether' | awk '{print $2}'`
nbSudo=`grep 'COMMAND' /var/log/sudo/sudo.log | wc -l`

wall "  #Architecture: $Archi
        #CPU physical : $pCPU
        #vCPU : $vCPU
        #Memory Usage: `free --mega | grep Mem | awk '{print $3}'`/`free --mega | grep Mem | awk '{print $2}'` `free --mega | grep Mem | awk '{printf("(%.2f%%)"), $2 / ($3 * 100)}'`
        #Disk Usage: `df -h --total | grep 'total' | awk '{print $3}'`/`df -h --total | grep 'total' | awk '{print $2}'` `df -h --total | grep 'total' | awk '{print $5}'`
        #CPU load: `top -bn1 | grep '^%Cpu' | awk '{printf("%.1f%%"), $2 + $4}'`
        #Last boot: `who -b | awk '{print $3 " " $4}'`
        #LVM use: `if [lsblk | grep 'lvm' | wc -l]; then echo 'no'; else echo 'yes'; fi`
        #Connections TCP : `grep 'TCP' /proc/net/sockstat | awk '{print $3}'` ESTABLISHED
        #User log: $nbUserLog
        #Network: IP $ipAdress ($macAdress)
        #Sudo : $nbSudo cmd"
