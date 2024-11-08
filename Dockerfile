# Use an official Maven image to build the app
FROM maven:3.8.6-openjdk-11 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the pom.xml and download dependencies (cache dependencies for faster builds)
COPY pom.xml .
RUN mvn dependency:go-offline

# Copy the source code into the container
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Use an OpenJDK image to run the app
FROM openjdk:11-jre-slim

# Set the working directory in the final image
WORKDIR /app

# Copy the jar file from the build stage to the final image
COPY --from=build /app/target/spring-boot-2-hello-world-1.0.2-SNAPSHOT.jar app.jar

# Expose thdoce port on which the app will run
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "app.jar"]
