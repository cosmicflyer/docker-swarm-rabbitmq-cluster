up:
	docker network inspect rabbitmq-backend > /dev/null || docker network create --driver=overlay rabbitmq-backend
	docker network inspect rabbitmq-frontend > /dev/null || docker network create --driver=overlay rabbitmq-frontend
	docker stack deploy -c docker-stack-rabbitmq.yml rabbitmq
	sleep 30
	/bin/bash create_cluster.sh

down:
	docker stack rm rabbitmq

status:
	docker stack ps rabbitmq
	docker stack services rabbitmq
