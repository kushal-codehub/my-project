# Stage 1: build JAR
FROM gradle:7.6.0-jdk17 AS builder
WORKDIR /app
COPY . .
RUN gradle build --no-daemon

# Stage 2: runtime
FROM openjdk:17-jdk-slim
WORKDIR /usr/app
COPY --from=builder /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
