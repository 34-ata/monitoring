total_mem=$(df -BG | grep "dev/mapper" | awk '{s+=$2} END {print s}')
total_mem_usage=$(df -BM | grep "dev/mapper" | awk '{s+=$3} END {print s}')
percent=$(df -BM | grep "dev/mapper" | awk '{s+=$2; t+=$3} END {printf("%.2f"), t/s*100}')
wall "#Architecture: $(uname -a)
#CPU physical: $(cat /proc/cpuinfo | grep "physical id" | wc -l)
#vCPU: $(nproc)
#Memory Usage: $(free -m | grep "Mem:" | awk '{print $3"/"$2"MB", "("$3/$2*100"%"")"}')
#Disk Usage: $total_mem_usage/$total_mem"Gb" ($percent%)
#CPU load: $(mpstat | awk 'NR==4{print $4+$6}')%
#Last boot: $(uptime -s)
#LVM use: $(if [ $(lsblk | grep lvm | wc -l) -eq 0 ]; then echo No; else echo Yes; fi)
#Connections TCP: $(netstat -ant | grep ESTABLISHED | wc -l) ESTABLISHED
#User log: $(users | wc -w)
#Network: IP $(hostname -I) ($(ip link show | grep ether | awk '{print $2}'))
#Sudo: $(cat /var/log/sudo/sudo.log | grep COMMAND | wc -l) cmd"
