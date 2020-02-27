SERVICE_NAME=${PWD##*/}
JAR=$SERVICE_NAME.jar
MPORT=8060
mv app.jar $JAR

echo ">>> kill -9 $(lsof -t -sTCP:LISTEN -i:$MPORT)"
kill -9 $(lsof -t -sTCP:LISTEN -i:$MPORT)

JAVA_OPTS="-Xms100m -Xmx100m -Dspring.profiles.active=dev"
echo ">>> nohup java -jar $JAVA_OPTS $JAR >app.log &"
BUILD_ID=dontKillMe nohup java -jar $JAVA_OPTS $JAR >app.log &


