FROM maven as build
WORKDIR /app
COPY . /app
RUN mvn install

FROM openjdk:11
WORKDIR /app
COPY --from=build /app/target/*.jar /app/
CMD ["java","-jar","*.jar"]
