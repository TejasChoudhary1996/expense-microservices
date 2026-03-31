FROM eclipse-temurin:17-jdk-jammy

# Copy jar file (will explain below)
COPY target/discovery-server-1.0.0.jar app.jar

# Run the app
ENTRYPOINT ["java", "-jar", "/app.jar"]