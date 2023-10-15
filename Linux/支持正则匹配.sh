#!/bin/bash

TOPK={{topk}}         # 前k个进程
SECS={{samplingTime}} # 采样时间，单位秒
INTERVAL={{interval}} # 采样间隔时间，单位秒
STEPS=$(($SECS / $INTERVAL))
TEMP_FILE_PREFIX="/tmp/tat_public_cpu_usage"

echo Watching CPU usage...
for ((i = 0; i < $STEPS; i++)); do
  ps -eocomm,pcpu | tail -n +2 >>$TEMP_FILE_PREFIX.$$
  sleep $INTERVAL
done

echo
echo CPU eaters :
cat $TEMP_FILE_PREFIX.$$ |
  awk '
{ process[$1]+=$2;}

END{
  for(i in process) {
    printf("%-20s %s\n",i, process[i]) ;
  }
}' | sort -nrk 2 | head -n $TOPK

rm $TEMP_FILE_PREFIX.$$
