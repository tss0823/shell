#!/bin/bash
#clear old tomcat log

#remove app logs
echo "remove app logs before 1 days"
find /u01/logs/app/ -type f -atime +1 | xargs rm -fr

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

#clear task log
log_name=`date "+%Y.%m"`
curl_cmd="curl 'http://localhost:9200/task_log-$log_name' -X DELETE -H 'Pragma: no-cache' -H 'Origin: http://localhost:9200' -H 'Accept-Encoding: gzip, deflate' -H 'Accept-Language: zh-CN,zh;q=0.9,en;q=0.8' -H 'User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36' -H 'Accept: application/json, text/javascript, */*; q=0.01' -H 'Cache-Control: no-cache' -H 'X-Requested-With: XMLHttpRequest' -H 'Cookie: JSESSIONID=8CB7ABDC350F3FF69D9D532A266BDC89' -H 'Connection: keep-alive' -H 'Referer: http://localhost:9200/_plugin/head/' --compressed"
eval $curl_cmd
