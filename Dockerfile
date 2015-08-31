FROM centos:latest
ADD apr.tar.xz /
ENV TZ "Asia/Shanghai"
ENV LANG=zh_CN.UTF-8
RUN localedef -f UTF-8 -i zh_CN zh_CN.UTF-8

## java install
ENV JAVA_VERSION 7u80-b15
# ENV JAVA_NAME jdk-7u80-linux-x64
ENV JAVA_NAME server-jre-7u80-linux-x64
ENV JAVA_URL http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION/$JAVA_NAME.tar.gz
ENV JAVA_HOME /usr/java/default
RUN mkdir -p $JAVA_HOME \
    && curl -skLH "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" $JAVA_URL \
    | tar  --strip-components=1 -zxC /usr/java/default \
    && ln -s $JAVA_HOME/lib/amd64/jli/libjli.so /usr/lib64/

## tomcat install
ENV TOMCAT_MAJOR 7
ENV TOMCAT_VERSION 7.0.64
ENV TOMCAT_TGZ_URL https://www.apache.org/dist/tomcat/tomcat-$TOMCAT_MAJOR/v$TOMCAT_VERSION/bin/apache-tomcat-$TOMCAT_VERSION.tar.gz
ENV CATALINA_HOME /usr/local/tomcat
RUN mkdir -p $CATALINA_HOME
WORKDIR $CATALINA_HOME
RUN curl -fSsL $TOMCAT_TGZ_URL | tar --strip-components=1 -zx \
    && rm bin/{*.bat,*.tar.gz}
COPY setenv.sh bin/
COPY tomcat-users.xml conf/
COPY server.xml conf/
CMD ["./bin/catalina.sh","run"]

# for main web interface:
EXPOSE 8080
