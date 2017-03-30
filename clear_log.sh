#!/bin/bash
#clear old tomcat log

#remove app logs
echo "remove app logs before 7 days"
find /u01/logs/app/ -type f -atime +7 | xargs rm -fr

#clear logstash log
echo "clear logstash logs"
echo > /u01/logstash-2.3.1/logs/inner.log
echo > /u01/logstash-2.3.1/logs/outer.log

#clear nginx logs
echo "clear nginx logs"
find /u01/logs/nginx/ -type f | while read file; do echo -n >"$file"; done

#clear tomcat log
echo "clear tomcat logs"
find /u01/deploy/project/tomcat_*/logs -type f | while read file; do echo -n >"$file"; done

echo "remove tomcat app bak before 7 days"
find /u01/deploy/project/tomcat_*/bak/ -mtime +7  -name "*.BAK" | xargs rm -fr
