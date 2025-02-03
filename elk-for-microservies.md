1. Application
- Add dependency to `pom.xml`
```text
<!-- Logging -->
    <dependency>
        <groupId>net.logstash.logback</groupId>
        <artifactId>logstash-logback-encoder</artifactId>
        <version>6.6</version>
    </dependency>
```
- Create file `logback-spring.xml` at folder `resources`
```xml
<?xml version="1.0" encoding="UTF-8"?>
<configuration>
    <include resource="org/springframework/boot/logging/logback/base.xml"/>
    <appender name="logstash" class="net.logstash.logback.appender.LogstashTcpSocketAppender">
        <!-- <destination>localhost:5600</destination>--> <!--local env-->
        <destination>${LOGSTASH_HOST:-localhost:5600}</destination> <!--docker env-->
        <encoder class="net.logstash.logback.encoder.LoggingEventCompositeJsonEncoder">
            <providers>
                <mdc/>
                <context/>
                <logLevel/>
                <loggerName/>
                <pattern>
                    <pattern>
                        {
                        "appName": "backend-service"
                        }
                    </pattern>
                </pattern>
                <threadName/>
                <message/>
                <logstashMarkers/>
                <stackTrace/>
            </providers>
        </encoder>
    </appender>
    <root level="info">
        <appender-ref ref="logstash"/>
    </root>
</configuration>
```
2.Set up ELK
- Create file `logstash.conf` before run ELK
```text
input {
  tcp {
    # Socket port
    port => 5600
    codec => json
  }
}

output {
  elasticsearch {
    hosts => ["${XPACK_MONITORING_ELASTICSEARCH_HOSTS}"]
    index => "elk-index-%{appName}"
  }
}
```
- Create file `docker-compose.yml`
```dockerfile
  postgres:
    image: postgres
    container_name: postgres
    restart: unless-stopped
    environment:
      POSTGRES_USER: root
      POSTGRES_PASSWORD: root
      PGDATA: /data/posgres
    volumes:
      - postgres:/data/postgres
      - ./initdb.sql:/docker-entrypoint-initdb.d/init.sql
    ports:
      - '5431:5432'
    networks:
      - default

  backend-service:
    container_name: backend-service
    build:
      context: ./
      dockerfile: Dockerfile
    ports:
      - "8080:8080"
    environment:
      DATABASE_HOST: host.docker.internal
      DATABASE_PORT: 5431
      DATABASE_USERNAME: root
      DATABASE_PASSWORD: root
      LOGSTASH_HOST: host.docker.internal:5600
    networks:
      - default
  elastic-search:
    image: elasticsearch:7.14.1
    container_name: elasticsearch
    restart: always
    ports:
      - "9200:9200"
    environment:
      - discovery.type=single-node
    networks:
      - default

  kibana:
    image: kibana:7.14.1
    container_name: kibana
    restart: always
    ports:
      - "5601:5601"
    environment:
      - ELASTICSEARCH_HOSTS=http://elastic-search:9200
    networks:
      - default

  logstash:
    image: logstash:7.14.1
    container_name: logstash
    restart: always
    ports:
      - "5600:5600" # Socket port
      - "5044:5044"
    #      - "9600:9600"
    volumes:
      - ./logstash.conf:/usr/share/logstash/pipeline/logstash.conf
    environment:
      - XPACK_MONITORING_ELASTICSEARCH_HOSTS=http://elastic-search:9200
      - XPACK_MONITORING_ENABLED=true
    networks:
      - default

networks:
  default:
    name: backend-service

volumes:
  postgres:
#  mysql_data:
```
3. Check & Visualize Log
- Check [Elasticsearch](http:///localhost:9200/_cat/indices)


```text
green  open .geoip_databases                ZAjIgUaqRSyVELa7gxdCVA 1 0 37   0  35.3mb  35.3mb
yellow open elk-index-backend-service       vHmwCqbgR8G0p0w5HYN8RQ 1 1 27   0  69.4kb  69.4kb     <-- backend-service
green  open .kibana_task_manager_7.14.1_001 zhXqCEQ3S3CeFSDJXbMWHw 1 0 14 384 182.2kb 182.2kb
green  open .apm-custom-link                vMbL9Sc_QAOi5i10Q7Pgbg 1 0  0   0    208b    208b
green  open .apm-agent-configuration        FN6dobMeT4mGcW2Nlr7Wfg 1 0  0   0    208b    208b
green  open .kibana_7.14.1_001              oojTVbC2SuWY_Q77EoIDsg 1 0 14   0   2.1mb   2.1mb
green  open .kibana-event-log-7.14.1-000001 2YR_7gOxRrm8OB0iJfKyog 1 0  1   0   5.6kb   5.6kb
```
- create [indexPatterns](http://localhost:5601/app/management/kibana/indexPatterns)



### NODE
- các lệnh sử dụng
- 
```zsh
mvn package
```

- chạy docker compose để pull image  elastic-search, kibana, logstash
```zsh
docker compose up -d --build
```

- Xem logs của backend-service
```zsh
docker compose logs -tf backend-service
```
#### -t (--timestamps): Hiển thị thời gian log để biết khi nào log được ghi.
#### -f (--follow): Giống tail -f, giúp theo dõi log theo thời gian thực

- Xoá chạy lại các container
```zsh
docker compose down -v
```
#### -v: có nghĩa là xoá luôn các volume ẩn được tạo bởi Docker Compose

- Xoá container backend-service
```zsh
docker compose down -v backend-service
```

- chạy lại container backend-service
````zsh
docker compose up -d --build backend-service
```