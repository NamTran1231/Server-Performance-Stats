#!/bin/bash


echo "1. TOTAL CPU USAGE:"
top -b -n 1 | grep "Cpu(s)" | awk '{print "-> CPU Usage: " 100 - $8 "%"}'
echo ""

echo "2. TOTAL RAM USAGE:"
free -m | grep "Mem:" | awk '{
    total=$2; used=$3; free=$4;
    percent=(used/total)*100;
    printf "-> Total RAM: %d MB\n-> Used: %d MB (%.2f%%)\n-> Free: %d MB\n", total, used, percent, free
}'
echo "" 

echo "3. TOTAL DISK USAGE:"
df -h | grep -w "/" | awk '{
    printf "-> Total Disk: %s\n-> Used: %s (%s)\n-> Free: %s\n", $2, $3, $5, $4
}'
echo ""

echo "4. TOP 5 PROCESSES BY CPU USAGE:"
top -b -n 1 -o +%CPU | head -n 12 | tail -n 6

echo "5. TOP 5 PROCESSES BY MEMORY USAGE:"
top -b -n 1 -o +%MEM | head -n 12 | tail -n 6
echo ""
