From centos:centos6

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
	
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm \
	&& rpm --import http://www.rabbitmq.com/rabbitmq-signing-key-public.asc \
	&& yum install erlang rabbitmq-server.noarch -y \
	&& /usr/lib/rabbitmq/bin/rabbitmq-plugins enable rabbitmq_management

EXPOSE 5672 15672

CMD rabbitmq-server
