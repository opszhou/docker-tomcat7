#注意：请自行修改tomcat-user.xml 中tomcat manager的用户/密码

# dockerTomcat
a tomcat7 docker container base on centos7

# 使用方法
  * git clone https://github.com/atvirt/docker-tomcat7
  * docker build tomcat7
  * docker tag \<images_id\> tomcat7
  
# 运行容器
  * docker run -d -p 8080:8080 tomcat7
  * docker run -d -v /data/webapps:/usr/local/tomcat/webapps -p 8080:8080 tomcat7
  
