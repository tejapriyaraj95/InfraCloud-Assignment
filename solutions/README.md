#                                              InfraCloud Assignment

## Commands used in the part 1:

<ol>
  <li>docker run -d --name csv infracloudio/csvserver:latest</li>
  <li>Creating gencsv.sh script file 
    <ol>
      <li>vi gencsv.sh</li>
      <li>:wq!</li>
    </ol>
  </li>
  <li>chmod +x gencsv.sh </li>
  <li>./gencsv.sh 2 8 </li>
  <li>docker run -d  --name csvtest -v /Users/tejapriyarajkondamudi/Documents/InfraCloud-Assignment/solutions:/csvserver/inputdata  infracloudio/csvserver:latest </li>
  <li>docker exec -it csvtest sh</li>
  <li>sh-4.4# netstat -tulpn</li>
  <li>docker container stop csvtest</li>
  <li>docker run -d -p 9393:9300 --name csvserver -v /Users/tejapriyarajkondamudi/Documents/InfraCloud-Assignment/solutions/inputFile:/csvserver/inputdata --env CSVSERVER_BORDER=Orange infracloudio/csvserver:latest </li>
</ol>

## [gencsv.sh](https://github.com/tejapriyaraj95/InfraCloud-Assignment/blob/main/solutions/gencsv.sh):

- `gencsv.sh` bash script generate a file named inputFile which contains random numbers

```

#!/bin/bash
RANDOM=$$
num="$1"
count="$2"
while [[ ${num} -le ${count} ]]
do
    echo $num, $RANDOM
    (( num = num +1 ))
done > inputFile

```


## [docker-compose.yaml](https://github.com/tejapriyaraj95/InfraCloud-Assignment/blob/main/solutions/docker-compose.yaml):

- `docker-compose.yaml` creates csv server container and prometheus container.

```

version: '3.3'
services:
    prometheus:
        image: prom/prometheus:v2.22.0
        ports:
            - '9090:9090'
        command:
        - --config.file=/etc/prometheus/prometheus.yaml
        volumes:
        - ./prometheus.yaml:/etc/prometheus/prometheus.yaml:ro
        depends_on:
        - csvserver
    csvserver:
        ports:
            - '9393:9300'
        container_name: csvserver
        env_file:
            - csvserver.env
        volumes:
            - './inputFile:/csvserver/inputdata'
        image: 'infracloudio/csvserver:latest'

```

## [prometheus.yaml](https://github.com/tejapriyaraj95/InfraCloud-Assignment/blob/main/solutions/prometheus.yaml):

```
scrape_configs:
- job_name: csvserver
  scrape_interval: 5s
  static_configs:
  - targets:
    - csvserver:9300 

```

## References:
   - https://docs.docker.com/engine/reference/commandline/compose/
   - https://prometheus.io/docs/guides/cadvisor/

