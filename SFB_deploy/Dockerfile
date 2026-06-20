FROM tomcat:10.1-jdk17

# Install MySQL server
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server && \
    mkdir -p /var/run/mysqld && chown mysql:mysql /var/run/mysqld

# Copy your WAR file into Tomcat webapps
COPY SFB_FinalProject.war /usr/local/tomcat/webapps/ROOT.war

# Copy DB init script and startup script
COPY init.sql /init.sql
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 8080

CMD ["/start.sh"]
