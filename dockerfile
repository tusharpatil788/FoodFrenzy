#-----------Stage 1 : Build Environment -----------#
FROM maven:3.9-eclipse-temurin-17 as build
WORKDIR /app

#------------ Download dependencies-------#
COPY pom.xml .
RUN mvn -B dependency:go-offline

#-----------copy source code and build jar ---------#
COPY src ./src
RUN mvn -B clean package -DskipTests

#------------ stage 2: Runtime Environment ----------#
FROM eclipse-temurin:17-jre-alpine

#------------Pull in OS security patches----------#
RUN apk upgrade --no-cache

#-----------Run as non-root user-----------#
RUN addgroup -S app && adduser -S app -G app

WORKDIR /app
COPY --from=build /app/target/*.jar app.jar

USER app
ENTRYPOINT ["java","-jar","app.jar"]
