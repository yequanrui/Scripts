#!/bin/bash
processes=$(ps ax -o user,pid,ppid,pgid,args,stat,start,time)
zombies=$(echo -e "${processes}" | grep -E "\s(Z|z|Z.*)\s")
if [ $? == 1 ]; then
  echo "no zombie processes exists on machine"
else
  echo -e "${processes}" | head -1
  echo "$zombies"
fi
