FROM tomcat:10.1.18-jdk17-temurin-jammy
RUN apt upgrade -y

RUN mkdir tmp 
WORKDIR /tmp
COPY gradlew .
COPY *.gradle .
COPY build.gradle .
COPY src src
COPY gradle/wrapper gradle/wrapper

RUN chmod +x gradlew
RUN ./gradlew build

RUN mv build/libs/holamundo-0.0.1-SNAPSHOT.war ${CATALINA_HOME}/webapps/hola.war