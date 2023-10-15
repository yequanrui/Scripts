#!/bin/bash

# 所以主机，以空格分隔
ALL_HOSTS=(IP 地址 IP 地址)

for host in ${ALL_HOSTS[*]}; do
  {
    start_time=$(date +'%s')
    ssh $host "hostname" &>/dev/null
    sleep 2
    stop_time=$(date +'%s')
    time_consuming=$((stop_time - start_time))
    echo "$host: $time_consuming" >>hostname.txt
  } &
done
wait

host=$(sort -n -k 2 hostname.txt | head -1 | awk -F':' '{print $1}')
ssh $host "top -b -n 1"
