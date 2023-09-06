FROM tomcat:9.0
ENV TOMCAT_USER deployer
ENV TOMCAT_PASS deployer
WORKDIR /opt/tomcat/webapps
COPY  XYZtechnologies-1.0.war .
RUN echo '<tomcat-users>' > /opt/tomcat/conf/tomcat-users.xml && \
    echo '<role rolename="manager-gui"/>' >> /opt/tomcat/conf/tomcat-users.xml && \
    echo '<user username="'$TOMCAT_USER'" password="'$TOMCAT_PASS'" roles="manager-gui"/>' >> /opt/tomcat/conf/tomcat-users.xml && \
    echo '</tomcat-users>' >> /opt/tomcat/conf/tomcat-users.xml
EXPOSE 8080
CMD ["catalina.sh", "run"]
