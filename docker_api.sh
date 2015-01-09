#!/bin/sh
host_ip='192.168.1.16'
host_port='5000'
api="curl -s http://${host_ip}:${host_port}/v2"
name=($(${api}/_catalog | jq .[]| grep -oP '[a-z]+'))
printf "%-30s %s\n" REPOSITORY TAG
for ((i=0;i<${#name[@]};i++))
do
	printf "%-30s %s \n" ${name[$i]} $(${api}/${name[$i]}/tags/list| jq .tags[]| sed 's/\"//g')
done
