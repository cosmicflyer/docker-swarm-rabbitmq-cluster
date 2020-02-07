# Rabbitmq-cluster in Docker Swarm

1. Change rabbitmq user/password in docker-stack-rabbitmq.yml (rabbitmq/rabbitmq by default).

2. Add labels to nodes: 
```
    docker node update --label-add rabbitmq01=true node-1
    docker node update --label-add rabbitmq02=true node-2
    docker node update --label-add rabbitmq03=true node-3
```

3. Run

    make up
    
4. Check status 

    make status

5. Connect to any node to 

    amqp://user:password@node-ip
    http://node-ip:15672/

5. Stop

    make down
    
6. Test

    docker run -it --rm pivotalrabbitmq/perf-test:latest --uri amqp://rabbitmq:rabbitmq@node-ip
