# LavinMQ Helm Chart

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/lavinmq)](https://artifacthub.io/packages/search?repo=lavinmq)

This is a helm chart to deploy [LavinMQ](https://lavinmq.com) to a kubernetes cluster.
The below text is taken directly from the LavinMQ FAQ page at: [FAQ](https://lavinmq.com/documentation/frequently-asked-questions#what-is-lavinmq)

## What is LavinMQ?
LavinMQ is a high-performance messaging queuing software built upon the AMQP 0.9.1 protocol. It gives applications a common platform to send and receive messages. LavinMQ comes with low RAM requirements and the ability to handle extremely long queues and many connections. LavinMQ is built to include popular characteristics from other message brokers, combining the best from RabbitMQ and Kafka with the ease of use of AMQP.

Messages can be sent across languages, platforms, and OS, which decouples processes from each other and creates a highly scalable system. All AMQP client libraries work with LavinMQ and there are AMQP client libraries for almost every platform on the market including Ruby, Node.js, Java, Python, PHP and Crystal.

## What is a Message?
A message is the data transported between the publisher and the consumer; essentially a message is a byte array with headers on top.

## What is a Message Queue?
A message queue enables independent, unrelated applications to exchange information asynchronously. Message queues store packets of information created by other applications for yet another set of applications to consume. In doing so, a message queue prevents data loss and enables efficient, continuous system function even in the case of a network or another failure.

## What is a Message Broker?
LavinMQ is a message queuing server, also known as a message broker. A message broker’s purpose is to handle incoming messages from applications. The message broker routes the messages within the broker to one or many destinations and stores them in a queue until they are consumed by a consumer.

## What is AMQP?
LavinMQ implements an extension of the open standard AMQP 0.9.1 specification. It is the protocol used as the basis for a set of standards controlling the entire message passing process. LavinMQ implements the AMQP protocol, version 0.9.1.

As with other message queuing protocols, the defining features of AMQP are message orientation and queuing. Routing is another feature and is basically the process by which an exchange decides which queues to place your message on. Messages in LavinMQ are routed from the exchange to the queue depending on exchange types and keys. Reliability and security are other important features of AMQP

All AMQP client libraries work with LavinMQ and there are AMQP client libraries for almost every platform out there, including Ruby, Node.js, Java, Python, Crystal, and PHP.

## What is a Connection?
A connection is a TCP connection between your application and the LavinMQ broker.

## What is a Channel?
A channel is a virtual connection inside a (TCP) connection. A channel is used to send AMQP commands to the broker. Publishing or consuming messages or subscribing to a queue are all done over a channel.

## Why LavinMQ?
How can we use LavinMQ?
Imagine that you have a web service that receives many requests every second, where no request should get lost and the request processing is time-consuming. Further, imagine that your web service always has to be available and ready to receive a new request instead of being locked by the processing of previously received requests.

In this case, placing a queue between the web service and the processing service is the best way to achieve a successful outcome. The two processes will be decoupled and do not need to wait for each other. If you have a lot of requests coming in a short amount of time, the processing system will be able to process them all. The queue will persist requests if their number becomes really huge.

Then imagine that your business and your workload is growing and you need to scale up your system. All that is needed to be done now is to add more workers to work off the queues faster.

In addition to providing a buffer between a web service and another processing service, message queues can be used for more advanced scenarios. LavinMQ can be configured to route and distribute messages according to different rules and different processes. Messages can be added to different queues depending on how the messages should be handled. The processing systems can then process them at their leisure.

## How can I separate applications within the same broker?
Virtual Hosts (vhosts) make it possible to separate applications on one broker. You can isolate users, exchanges, queues, etc. to one specific vhost. You can separate environments, e.g. production to one vhost and staging to another vhost, within the same broker instead of setting up multiple brokers.

vhosts can be added to all dedicated instances. The downside of using a single instance is that there’s no resource isolation between virtual hosts.

Integration and availability

## Do I enable any plugins in LavinMQ?
No, all features are enabled by default.

## Which protocols does LavinMQ support?
LavinMQ supports AMQP version 0-9-1.

## What is lavinmqctl?
Yes, it is possible to use lavinmqctl directly to your LavinMQ running on CloudAMQP. The CLI tool accepts a full URI, including username and password under the --host flag. Use the same username and password as you use for your AMQP connections.

## How does LavinMQ perform?
A single m6g.large EC2 instance, with a GP3 EBS drive (XFS formatted), can sustain about 700.000 messages/s (16 byte msg body, single queue, single producer, single consumer). A single producer can push 1.600.000 msgs/s and if there’s no producers auto-ack consumers can receive 1.200.000 msgs/s.

Enqueueing 100 million messages only uses 25 MB RAM. 8000 connection uses only about 400 MB RAM. Declaring 100.000 queues uses about 100 MB RAM. About 1.600 bindings per second can be made to non-durable queues, and about 1000 bindings/second to durable queues.