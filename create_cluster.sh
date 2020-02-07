#!/bin/bash

docker exec -d rabbitmq_rabbitmq02.1.$(docker stack ps rabbitmq -f name=rabbitmq_rabbitmq02 -q --no-trunc)  bash -c "rabbitmqctl stop_app && rabbitmqctl join_cluster rabbit@rabbitmq01 && rabbitmqctl start_app"
docker exec -d rabbitmq_rabbitmq03.1.$(docker stack ps rabbitmq -f name=rabbitmq_rabbitmq03 -q --no-trunc)  bash -c "rabbitmqctl stop_app && rabbitmqctl join_cluster rabbit@rabbitmq01 && rabbitmqctl start_app"
