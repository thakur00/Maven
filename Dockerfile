FROM maven:3.5-jdk-8
RUN sed -i '/jessie-updates/d' /etc/apt/sources.list
RUN apt-get update  
RUN apt-get install -y maven
COPY pom.xml /usr/local/service/pom.xml
COPY src /usr/local/service/src
WORKDIR /usr/local/service

CMD ["java", "-cp", "target/sensor-demo-0.0.1-SNAPSHOT.jar", "sensor/SensorControl"] 

