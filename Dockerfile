# Use official Maven image to build the application
FROM maven:3.9.9-eclipse-temurin-21 AS build

# Set working directory in container
WORKDIR /app

# Copy your pom.xml and src folder into the container
COPY pom.xml .
COPY src ./src

# Package the application (creates a jar file in /app/target)
RUN mvn clean package -DskipTests

# Use OpenJDK image to run the jar
FROM eclipse-temurin:21-jdk

# Set working directory in runtime image
WORKDIR /app

# Copy the jar file from the builder stage
COPY --from=build /app/target/devops_integration.jar app.jar

# Expose port (update as per your Spring Boot app)
EXPOSE 8080

# Command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
