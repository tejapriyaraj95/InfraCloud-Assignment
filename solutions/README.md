# commands used in the part1:

<ol>
  <li>docker run -d --name csv infracloudio/csvserver:latest</li>
  <li>Creating gencsv.sh script file 
    <ol>
      <li>vi gencsv.sh</li>
      <li>:wq!</li>
    </ol>
  </li>
  <li>chmod +x gencsv.sh</li>
  <li>./gencsv.sh 2 8/li>
  <li>docker run -d  --name csvtest -v /Users/tejapriyarajkondamudi/Documents/InfraCloud-Assignment/solutions:/csvserver/inputdata  infracloudio/csvserver:latest item</li>
  <li>docker exec -it csvtest sh</li>
  <li>sh-4.4# netstat -tulpn</li>
  <li>docker container stop csvtest</li>
  <li>docker run -d -p 9393:9300 --name csvserver -v /Users/tejapriyarajkondamudi/Documents/InfraCloud-Assignment/solutions/inputFile:/csvserver/inputdata --env CSVSERVER_BORDER=Orange infracloudio/csvserver:latest/li>
</ol>

