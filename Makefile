KAFKA_VERSION = 2.12
KAFKA_RELEASE = 3.3.2
IMG_NAME = kafka
KAFKA_FILE = ${IMG_NAME}_${KAFKA_VERSION}-${KAFKA_RELEASE}

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

make-topic:
	cd ./downloads/${KAFKA_FILE} ; \
	bin/kafka-topics.sh --create --topic my-topic-name --partitions 5 --replication-factor 1 --bootstrap-server localhost:9092

write-event:
	cd ./downloads/${KAFKA_FILE} ; \
	bin/kafka-console-producer.sh --topic my-topic-name --bootstrap-server localhost:9092

read-event:
	cd ./downloads/${KAFKA_FILE}; \
	bin/kafka-console-consumer.sh --topic my-topic-name --from-beginning --bootstrap-server localhost:9092 

build-container:
	docker build -t ${IMG_NAME} .
