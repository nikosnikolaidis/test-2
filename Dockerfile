FROM maven:3.8.8-amazoncorretto-17 AS build
COPY . /.
RUN mvn package

FROM openjdk:17-oracle
COPY --from=build target/*.jar /app.jar
ENTRYPOINT [ "java", "-jar", "/app.jar" ]