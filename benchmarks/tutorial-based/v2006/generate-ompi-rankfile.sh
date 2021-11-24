#!/bin/sh

NODE_LIST=$(cat ./hostfile | awk '{print $1}' | tr "\n" " ")
RANK=0

[ -e ./rankfile ] && rm ./rankfile

for NODE in ${NODE_LIST}
do
 for SOCKET in {0..1} 
 do
  for CORE in {0..17}
  do
   echo "rank ${RANK}=${NODE} slot=${SOCKET}:${CORE}" >> ./rankfile
   RANK=$((++RANK)) 
  done
 done
done
