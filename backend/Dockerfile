# Using an official jdk17 image
FROM openjdk:17-jdk-slim
# Set working directory

WORKDIR /app

# Copy the checked out source code into the container
COPY . .

# Install maven and build the project

RUN apt-get update && apt-get install -y maven && mvn clean package -DskipTests


# Set jar dfile name

# Copy the bult jar file into the container

RUN pwd
RUN find . -name "ecommerce*.jar"

COPY ./target/ecommerce-0.0.1-SNAPSHOT.jar my-ecom.jar

# Expose the application's port
EXPOSE 8080

# Run the java application
CMD ["java", "-jar", "my-ecom.jar"]