FROM openjdk:17-jdk-slim-buster

# Build Argument for JAR file
ARG JAR_FILE=build/libs/*.jar

# Fix: Manually specify the JAR file OR use a wildcard-friendly approach
COPY build/libs/my-app.jar app.jar  # Replace with your actual JAR filename

# Creating a directory for extracted contents
RUN mkdir -p /destination-dir-for-add

# Extracting sample.tar.gz automatically
ADD sample.tar.gz /destination-dir-for-add/

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app.jar"]

