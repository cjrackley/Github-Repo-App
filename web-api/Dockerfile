# syntax=docker/dockerfile:1

# ---------- stage 1: build ----------
FROM eclipse-temurin:25-jdk AS build
WORKDIR /app

# Dependency layer. Only invalidated when pom.xml or the wrapper changes,
# so ordinary source edits reuse the cached Maven downloads.
COPY .mvn/ .mvn/
COPY mvnw pom.xml ./
RUN chmod +x mvnw && ./mvnw -B dependency:go-offline

# Source layer. Tests are skipped because WebApiApplicationTests boots a
# full context and would need live database credentials at build time.
COPY src/ src/
RUN ./mvnw -B clean package -DskipTests

# ---------- stage 2: runtime ----------
FROM eclipse-temurin:25-jre
WORKDIR /app

RUN useradd -r -s /usr/sbin/nologin spring
USER spring

COPY --from=build /app/target/web-api-0.0.1-SNAPSHOT.jar app.jar

# Documentation only. The localhost binding is set by the publish flag
# in docker-compose.yml, not here.
EXPOSE 8080

# -Xms2g with AlwaysPreTouch commits and touches the whole heap at startup,
# keeping resident memory near 2 GB of the instance's 6 GB. That holds memory
# utilization above the 20% floor OCI uses to reclaim idle Always Free shapes.
ENTRYPOINT ["java", \
  "-Xms2g", \
  "-Xmx2g", \
  "-XX:+AlwaysPreTouch", \
  "-jar", "app.jar"]
