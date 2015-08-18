JAVA_HOME=/usr/java/default
TOMCAT_USER=root
CATALINA_OPTS="$CATALINA_OPTS -Djava.library.path=/usr/local/apr/lib/"
JAVA_OPTS="-Xms1024m -Xmx1024m -Dfile.encoding=UTF-8 -Duser.timezone=Asia/Shanghai -Duser.country=CN -Duser.language=zh -Duser.region=CN -Xss512k -XX:+UseParallelGC -XX:MaxPermSize=512m -XX:NewRatio=3 -XX:SurvivorRatio=6"
