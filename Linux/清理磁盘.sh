#!/bin/bash

function deletefiles() {
  if [ ! -d $2 ]; then
    echo "The specified directory("$2") is not exist."
    return
  fi

  expiredTimeUnit=${1: -1}
  expiredTimeValue=${1:0:-1}

  if [ "$expiredTimeUnit" = "d" ]; then
    expiredTime=$(($expiredTimeValue * 24 * 60 * 60))
  elif [ "$expiredTimeUnit" = "h" ]; then
    expiredTime=$(($expiredTimeValue * 60 * 60))
  elif [ "$expiredTimeUnit" = "m" ]; then
    expiredTime=$(($expiredTimeValue * 60))
  else
    echo "The unit("$expiredTimeUnit") of file age is not supported."
    return
  fi

  for file in $(find $2 -type f -name "$3"); do
    local currentDate=$(date +%s)
    local modifyDate=$(stat -c %Y $file)
    local existTime=$(($currentDate - $modifyDate))

    if [ $existTime -gt $expiredTime ]; then
      echo "File cleaning succeeded,path:"$file"."
      rm -f $file
    fi
  done
}

# delayTime	文件的有效时间。如：7d（代表7天）、1h（代表1小时）、5m（代表5分钟）
# filePath 清理文件路径。如：/root/log/
# matchPattern 清理文件匹配格式，支持正则匹配。如*.log

deletefiles {{delayTime}} {{filePath}} "{{matchPattern}}"
