# Step 1: Build WAR
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

RUN ls -R /app

# Step 2: Run in Tomcat
FROM tomcat:10-jdk17
RUN rm -rf /usr/local/tomcat/webapps/*
COPY --from=build /app/ui-service/target/*.war /usr/local/tomcat/webapps/ROOT.war