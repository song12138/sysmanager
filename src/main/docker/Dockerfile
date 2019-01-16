FROM java:8

ENV SPRING_OUTPUT_ANSI_ENABLED=ALWAYS \
    JAVA_OPTS="-Xms256M -Xmx512M -XX:PermSize=256m -XX:MaxPermSize=512m" \
    TZ=Asia/Shanghai

ADD target/*.jar /app.jar

CMD echo "${TZ}" > /etc/timezone && \
    java ${JAVA_OPTS} -jar /app.jar
