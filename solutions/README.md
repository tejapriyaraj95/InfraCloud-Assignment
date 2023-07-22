commands used in the part1:

1) docker run -d --name csv infracloudio/csvserver:latest
2) vi gencsv.sh
3) chmod +x gencsv.sh
4) ./gencsv.sh 2 8
5) docker run -d  --name csvtest -v /Users/tejapriyarajkondamudi/Documents/InfraCloud-Assignment/solutions:/csvserver/inputdata  infracloudio/csvserver:latest
6) docker exec -it csvtest sh
7) sh-4.4# netstat -tulpn
8) docker container stop csvtest
9) docker run -d -p 9393:9300 --name csvserver -v /Users/tejapriyarajkondamudi/Documents/InfraCloud-Assignment/solutions/inputFile:/csvserver/inputdata --env CSVSERVER_BORDER=Orange infracloudio/csvserver:latest
