FROM ubuntu:trusty

RUN apt-get update ;\
    apt-get install -y curl openjdk-7-jre-headless supervisor ;\
    curl https://packages.elasticsearch.org/GPG-KEY-elasticsearch | apt-key add - ;\
    echo "deb http://packages.elasticsearch.org/logstash/1.5/debian stable main" > /etc/apt/sources.list.d/logstash.list ;\
    apt-get update ;\
    apt-get install -y logstash ;\
    mkdir /etc/logstash/patterns ;\
    rm -rf /var/lib/apt/lists/*

ADD logstash.conf /etc/supervisor/conf.d/logstash.conf
ADD supervisor.conf /etc/supervisor/conf.d/supervisor.conf

VOLUME /etc/logstash/conf.d
VOLUME /etc/logstash/patterns

ENTRYPOINT ["supervisord"]
