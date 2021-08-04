FROM openjdk:8-jdk-alpine
EXPOSE 8090
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} Devops-Test.jar
ENTRYPOINT ["java","-jar","/Devops-Test.jar"]
MAINTAINER "Mohit Wadhwani"