FROM cloudsihmar/maven:spring AS build
WORKDIR /app
COPY . .
RUN mvn package

FROM tomcat:8.5.40
COPY --from=build /app/target/sampleapp.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
