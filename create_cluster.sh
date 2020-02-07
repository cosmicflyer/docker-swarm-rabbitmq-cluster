#!/bin/bash

#docker exec -d rabbitmq_rabbitmq02.1.$(docker stack ps rabbitmq -f name=rabbitmq_rabbitmq02 -q --no-trunc)  bash -c "rabbitmqctl stop_app && rabbitmqctl join_cluster rabbit@rabbitmq01 && rabbitmqctl start_app"
#docker exec -d rabbitmq_rabbitmq03.1.$(docker stack ps rabbitmq -f name=rabbitmq_rabbitmq03 -q --no-trunc)  bash -c "rabbitmqctl stop_app && rabbitmqctl join_cluster rabbit@rabbitmq01 && rabbitmqctl start_app"

targets="rabbitmq02 rabbitmq03"

for i in $targets; do
    container_name=$(docker stack ps rabbitmq -f name=rabbitmq_${i} --no-trunc | awk '{print $2}' |grep -v NAME)
    container_id=$(docker stack ps rabbitmq -f name=rabbitmq_${i} -q --no-trunc)
    docker exec -d ${container_name}.${container_id} bash -c "rabbitmqctl stop_app && rabbitmqctl join_cluster rabbit@rabbitmq01 && rabbitmqctl start_app"
done
