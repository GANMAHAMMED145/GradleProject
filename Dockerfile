FROM openjdk:17-jdk-slim-buster

# Build Argument for JAR file
ARG JAR_FILE=build/libs/my-app-0.0.1-SNAPSHOT.jar  # Adjust based on your actual JAR filename

# Copy the built JAR file to the container
COPY ${JAR_FILE} app.jar

# Creating a directory for extracted contents
RUN mkdir -p /destination-dir-for-add

# Extracting sample.tar.gz automatically
ADD sample.tar.gz /destination-dir-for-add/

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "/app.jar"]


