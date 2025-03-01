# Step 1: Build Stage
FROM openjdk:17-jdk-slim-buster AS build
WORKDIR /app
COPY . .
RUN ./gradlew clean build -x test  # Skip tests for faster build

# Step 2: Runtime Image
FROM openjdk:17-jdk-slim-buster
WORKDIR /app
COPY --from=build /app/build/libs/*.jar /app/
ENTRYPOINT ["sh", "-c", "java -jar /app/$(ls /app | grep .jar)"]





