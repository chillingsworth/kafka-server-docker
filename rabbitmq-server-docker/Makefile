RABBITMQ_NAME = gpt-queue

rabbit-pull:
	docker pull rabbitmq:3-management

rabbit-run: rabbit-pull
	docker run --rm -it --hostname ${RABBITMQ_NAME} -p 15672:15672 -p 5672:5672 rabbitmq:3-management
