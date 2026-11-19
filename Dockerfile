
# Build stage
FROM bellsoft/liberica-openjdk-debian:21 AS build

WORKDIR /app

# Install Maven
RUN apt-get update && apt-get install -y maven \
    && rm -rf /var/lib/apt/lists/*

# Copy project files
COPY pom.xml .
COPY src ./src
COPY images ./images

# Build Spring Boot application
RUN mvn clean package -DskipTests

# Runtime stage
FROM bellsoft/liberica-openjdk-debian:21

WORKDIR /app

COPY --from=build /app/target/*.jar app.jar
COPY --from=build /app/images ./images

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
