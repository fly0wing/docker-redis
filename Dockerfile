# dockerfile
FROM fly0wing/docker-centos
MAINTAINER fly0wing <fly0wing@126.com>

# install redis
ADD software/redis-2.8.16.tar.gz /home/redis/redis-2.8.16.tar.gz

RUN cd /home/redis && tar xzf redis-2.8.16.tar.gz && \
	cd redis-2.8.16 && make && src/redis-server && \
	rm /home/redis/redis-2.8.16.tar.gz
