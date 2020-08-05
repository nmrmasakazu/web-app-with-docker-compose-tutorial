FROM openjdk:latest

RUN yum install -y mysql

COPY ./src /app/src
COPY ./target /app/target

ENV JAR_TARGET "nmrmasakazu-0.0.1-SNAPSHOT.jar"
ENTRYPOINT ["sh", "-c", "java -jar app/target/${JAR_TARGET}"]
