#!/bin/sh

echo "Initializing ODROID-C Ethernet..."

# Network Tweaks. Thanks to mlinuxguy
echo 32768 > /proc/sys/net/core/rps_sock_flow_entries
echo 2048 > /sys/class/net/eth0/queues/rx-0/rps_flow_cnt
echo 7 > /sys/class/net/eth0/queues/rx-0/rps_cpus
echo 7 > /sys/class/net/eth0/queues/tx-0/xps_cpus

# Move IRQ's of ethernet to CPU1/2
echo 1,2 > /proc/irq/40/smp_affinity_list

