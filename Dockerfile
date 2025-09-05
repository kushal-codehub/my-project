FROM openjdk:8-jre-alpine

EXPOSE 8080

WORKDIR /usr/app

COPY ./build/libs/my-app-1.0-SNAPSHOT.jar /usr/app/

ENTRYPOINT ["java", "-jar", "my-app-1.0-SNAPSHOT.jar"]
