FROM eclipse-temurin:18 AS build
WORKDIR /app
COPY . .
RUN ./gradlew clean shadowJar

FROM eclipse-temurin:18
COPY --from=build /app/build/libs/muddle*-all.jar /app
ENTRYPOINT ["java", "-jar", "/app"]
