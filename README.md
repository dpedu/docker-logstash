docker-logstash
===============

Container for running [Logstash](https://www.elastic.co/products/logstash).

*Usage:*

* Build: `docker build -t logstash .`
* Run: `docker run -d -v /logstash/configs:/etc/logstash/conf.d -p 1234:1234 logstash`

*Extras:*

* Add patterns dir: `-v -v /my/logstash/patterns:/etc/logstash/patterns`
