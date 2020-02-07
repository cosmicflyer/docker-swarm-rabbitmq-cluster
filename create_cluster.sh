#!/bin/bash

targets="rabbitmq02 rabbitmq03"

for i in $targets; do
    container_name=$(docker stack ps rabbitmq -f name=rabbitmq_${i} --no-trunc | awk '{print $2}' |grep -v NAME)
    container_id=$(docker stack ps rabbitmq -f name=rabbitmq_${i} -q --no-trunc)
    docker exec -d ${container_name}.${container_id} bash -c "rabbitmqctl stop_app && rabbitmqctl join_cluster rabbit@rabbitmq01 && rabbitmqctl start_app"
done
