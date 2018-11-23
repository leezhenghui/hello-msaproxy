#!/bin/bash

export NOMAD_ADDR=
export NOMAD_CMD=/opt/nomad/bin/nomad

echo "Stopping addsvc-job"
$NOMAD_CMD job stop addsvc-job 

echo "Stopping subsvc-job"
$NOMAD_CMD job stop subsvc-job 

echo "Stopping frontend-job"
$NOMAD_CMD job stop frontend-job 

echo "Stopping api-gateway-job"
$NOMAD_CMD job stop api-gateway-job

echo "Stopping hashi-ui"
$NOMAD_CMD job stop hashi-ui 

echo 'wait 5s...'
sleep 5
curl --request PUT  http://localhost:4646/v1/system/gc
echo 'force GC for nomad, await for work directory cleanup...'
sleep 15
echo 'done'
