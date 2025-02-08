# Using an official jdk17 image
FROM open-jdk:17-slim
# Set working directory

WORKDIR /app

# Copy the checked out source code into the container
COPY . .

# Install maven and build the project

RUN apt-get udpate && at-get install -y maven && mvn clean package -DskipTests


# Set jar dfile name
ARG JAR_FILE=target/ecommerce-0.0.1-SNAPSHOT.jar

# Copy the bult jar file into the container
COPY ${JAR_FILE} my-ecom.jar

# Expose the application's port
EXPOSE 8080

# Run the java application
CMD ["java", "-jar", "my-ecom.jar"]