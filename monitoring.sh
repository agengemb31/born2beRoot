#!/bin/bash

wall "  #Architecture: `uname -srvmo`
        #CPU physical : `grep 'physical id' /proc/cpuinfo | wc -l`
        #vCPU : `grep 'processor' /proc/cpuinfo | wc -l`
        #Memory Usage: `free -h | grep Mem | awk '{print $3}'`/`free -h | grep Mem | awk '{print $2}'` `free | grep Mem | awk '{printf("(%.2f%%)"), $2 / $3 * 100}'`
        #Disk Usage: `df -h --total | grep 'total' | awk '{print $3}'`/`df -h --total | grep 'total' | awk '{print $2}'` `df -h --total | grep 'total' | awk '{print ($5)}'`
        #CPU load: `top -bn1 | grep '^%Cpu' | awk '{printf("%.1f%%"), $2 + $4}'`
        #Last boot: `who -b | awk '{print $3 " " $4}'`
        #LVM use: `if [lsblk | grep 'lvm' | wc -l]; then echo 'no'; else echo 'yes'; fi`
        #Connections TCP : `grep 'TCP' /proc/net/sockstat | awk '{print $3}'` ESTABLISHED
        #User log: `who | wc -l`
        #Network: IP `hostname -I | awk '{print $1}'` (`ip link | grep 'link/ether' | awk '{print $2}'`)
        #Sudo : `grep 'COMMAND' /var/log/sudo/sudo.log | wc -l`"
