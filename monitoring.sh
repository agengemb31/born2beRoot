#!/bin/bash

Archi=`uname -srvmo`
pCPU=`grep 'physical id' /proc/cpuinfo | wc -l`
vCPU=`grep 'processor' /proc/cpuinfo | wc -l`
memoryUses=`free --mega | grep Mem | awk '{print $3}'`
totalMemory=`free --mega | grep Mem | awk '{print $2}'`
memoryPercentage=`free --mega | grep Mem | awk '{printf("(%.2f%%)"), $3 / ($2 * 100)}'`
diskUses=`df -h --total | grep 'total' | awk '{print $3}' | sed "s/G//g"`
totalDisk=`df -h --total | grep 'total' | awk '{print $2}' | sed "s/G//g"`
diskPercentage=`df -h --total | grep 'total' | awk '{print $5}'`
cpuLoad=`top -bn1 | grep '^%Cpu' | awk '{printf("%.1f%%"), $2 + $4}'`
lastBootDate=`who -b | awk '{print $3 " " $4}'`
isLvmUse=`if [lsblk | grep 'lvm' | wc -l]; then echo 'no'; else echo 'yes'; fi`
nbTcp=`grep 'TCP' /proc/net/sockstat | awk '{print $3}'`
nbUserLog=`who | wc -l`
ipAdress=`hostname -I | awk '{print $1}'`
macAdress=`ip link | grep 'link/ether' | awk '{print $2}'`
nbSudo=`grep 'COMMAND' /var/log/sudo/sudo.log | wc -l`
MB='MB'
Gb='Gb'

wall "  #Architecture: $Archi
        #CPU physical : $pCPU
        #vCPU : $vCPU
        #Memory Usage: $memoryUses/$totalMemory$MB $memoryPercentage 
        #Disk Usage: $diskUses/$totalDisk$Gb ($diskPercentage)
        #CPU load: $cpuLoad
        #Last boot: $lastBootDate
        #LVM use: $isLvmUse
        #Connections TCP : $nbTcp ESTABLISHED
        #User log: $nbUserLog
        #Network: IP $ipAdress ($macAdress)
        #Sudo : $nbSudo cmd"
