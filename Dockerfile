FROM tomcat:8.0-alpine
COPY target/WebApp.war /usr/local/tomcat/webapps/
#COPY tomcat-users.xml /usr/local/tomcat/conf/
#If you to want manage deployed applications through Application manager above content of file need to be added into tomcat-users.xml`
EXPOSE 8080
#CMD ["catalina.sh", "run"]
#Tomcat container by default run catalina.sh script so no need to add step in Dockerfile manually and can be inspected by running "docker image inspect tomcat:8.0-alpine". you can see in Cmd field.
