KAFKA_VERSION = 2.12
KAFKA_RELEASE = 3.3.2
IMG_NAME = kafka
KAFKA_FILE = ${IMG_NAME}_${KAFKA_VERSION}-${KAFKA_RELEASE}
QUESTION_TOPIC = questions
ANSWER_TOPIC = answers

get-kafka:
	wget -P ./downloads https://downloads.apache.org/kafka/${KAFKA_RELEASE}/${KAFKA_FILE}.tgz

install: get-kafka
	cd ./downloads ; \
	tar -xzf ${KAFKA_FILE}.tgz

start-zookeeper:
	cd ./downloads/${KAFKA_FILE} ; \
	bin/zookeeper-server-start.sh config/zookeeper.properties

start-server:
	cd ./downloads/${KAFKA_FILE} ; \
	bin/kafka-server-start.sh config/server.properties 

create-topic:
	cd ./downloads/${KAFKA_FILE} ; \
	bin/kafka-topics.sh --create --topic ${QUESTION_TOPIC} --partitions 5 --replication-factor 1 --bootstrap-server localhost:9092 ; \
	bin/kafka-topics.sh --create --topic ${ANSWER_TOPIC} --partitions 5 --replication-factor 1 --bootstrap-server localhost:9092

read-question:
	cd ./downloads/${KAFKA_FILE}; \
	bin/kafka-console-consumer.sh --topic ${QUESTION_TOPIC} --from-beginning --bootstrap-server localhost:9092 

write-question:
	cd ./downloads/${KAFKA_FILE} ; \
	bin/kafka-console-producer.sh --topic ${QUESTION_TOPIC} --bootstrap-server localhost:9092

write-answer:
	cd ./downloads/${KAFKA_FILE} ; \
	bin/kafka-console-producer.sh --topic ${ANSWER_TOPIC} --bootstrap-server localhost:9092

read-answer:
	cd ./downloads/${KAFKA_FILE}; \
	bin/kafka-console-consumer.sh --topic ${ANSWER_TOPIC} --from-beginning --bootstrap-server localhost:9092 

build-image:
	docker build -t ${IMG_NAME} .

run-container:
	docker run --network="host" -d ${IMG_NAME}
