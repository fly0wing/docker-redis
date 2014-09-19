# dockerfile
FROM fly0wing/docker-centos
MAINTAINER fly0wing <fly0wing@126.com>

# install redis
ADD software/redis-2.8.16.tar.gz /home/redis

RUN cd /home/redis/redis-2.8.16 && make && make install && \
	cp -f src/redis-sentinel /usr/local/bin && \
	mkdir -p /etc/redis && \
	cp -f *.conf /etc/redis && \
	rm -rf /tmp/redis-stable* && \
	sed -i 's/^\(bind .*\)$/# \1/' /etc/redis/redis.conf && \
	sed -i 's/^\(daemonize .*\)$/# \1/' /etc/redis/redis.conf && \
	sed -i 's/^\(dir .*\)$/# \1\ndir \/data/' /etc/redis/redis.conf && \
	sed -i 's/^\(logfile .*\)$/# \1/' /etc/redis/redis.conf && \
	rm -rf /home/redis/


# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["redis-server", "/etc/redis/redis.conf"]

# Expose ports.
EXPOSE 6379

