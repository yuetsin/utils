From openjdk:8u232-slim

RUN apt-get update -y \
    && apt-get install curl -y \
    && useradd ctf \
    && mkdir /opt/app

COPY hellox.jar /opt/app
COPY flag /flag

WORKDIR /opt/app

USER ctf
CMD ["java", "-Djdk.serialFilter=!com.sun.syndication.feed.impl.ObjectBean;!com.rometools.rome.feed.impl.ObjectBean;", "-jar", "/opt/app/hellox.jar"]
