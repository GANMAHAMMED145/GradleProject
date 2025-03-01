# Step 1: Build the app inside the container
FROM openjdk:17-jdk-slim-buster AS build
WORKDIR /app
COPY . .
RUN ./gradlew clean build -x test  # Skip tests to speed up build

# Step 2: Create a lightweight runtime image
FROM openjdk:17-jdk-slim-buster
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]



