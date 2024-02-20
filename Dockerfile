FROM tomcat:10.1.18-jdk17-temurin-jammy

RUN apt update
RUN apt upgrade -y

RUN mkdir tmp 

WORKDIR /tmp
COPY gradlew .
COPY *.gradle .
COPY src src
COPY gradle/wrapper gradle/wrapper

RUN chmod +x gradlew
RUN ./gradlew build

RUN mv build/libs/holamundo-1.0.0.war ${CATALINA_HOME}