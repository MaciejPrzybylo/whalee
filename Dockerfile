FROM maven as mvn
WORKDIR /build
COPY . .
RUN mvn clean package
FROM java:8
WORKDIR /opt/do
COPY --from=mvn /build/target/todo-1.jar app.jar
ENTRYPOINT ["/usr/bin/java", "-jar", "app.jar"]
