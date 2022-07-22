# Start with a base image containing Java runtime
FROM openjdk:18.0.1.1
#FROM java

# Add Author info
LABEL maintainer="miriet@mz.co.kr"

# Add a volume to /tmp
VOLUME /app

# Make port 8080 available to the world outside this container
EXPOSE 8080

# The application's jar file
#ARG JAR_FILE=build/libs/calc_boot-0.0.1-SNAPSHOT-plain.jar
ARG JAR_FILE=out/artifacts/calc_acs.jar

# Add the application's jar to the container
ADD ${JAR_FILE} calc-ecs.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/calc-ecs.jar"]
