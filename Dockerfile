FROM maven:3.5-alpine as builder

COPY eureka-service/ /eureka-service

RUN cd /eureka-service && mvn package -DskipTests

FROM openjdk:8-alpine 

COPY --from=builder /eureka-service/target/eureka-service-0.0.1-SNAPSHOT.jar /opt/eureka.jar

CMD java -jar /opt/eureka.jar

