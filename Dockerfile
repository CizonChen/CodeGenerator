FROM 192.168.0.34:5000/jdk1.8
RUN apt-get install -y unzip
COPY target/generator-web-0.0.1-SNAPSHOT.jar generator-web.jar
ENV JAVA_HOME=/opt/jdk1.8.0_171
ENV PATH=$JAVA_HOME/bin:$PATH
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV JAVA_OPTS="-Xms1024m -XX:PermSize=512m -XX:MaxPermSize=256m -XX:MaxNewSize=128m"
EXPOSE 1234
ENTRYPOINT java ${CATALINA_OPTS} ${JAVA_OPTS}   -jar /generator-web.jar