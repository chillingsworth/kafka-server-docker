import pika
from rabbitmq import RabbitMQ

r = RabbitMQ('question_queue', 'answer_queue')

r.publish('How old are structured settlements?')