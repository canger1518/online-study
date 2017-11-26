FROM registry.cn-hangzhou.aliyuncs.com/canger-all/docker-image:java-8

MAINTAINER 沧洱 <gy_1518@126.com>
RUN mkdir -p  /home/admin/online-study
ENV app_name="online-study"
ENV work_dir="/home/admin/online-study"
ENV JAVA_OPTS=" -Dcatalina.vendor=canger -Djava.security.egd=file:/dev/./urandom -Dlog4j.defaultInitOverride=true -Dorg.apache.tomcat.util.http.ServerCookie.ALLOW_EQUALS_IN_VALUE=true -Dorg.apache.tomcat.util.http.ServerCookie.ALLOW_HTTP_SEPARATORS_IN_V0=true -server -Xms512m -Xmx512m -XX:MetaspaceSize=256m -XX:MaxMetaspaceSize=256m -Xmn256m -XX:MaxDirectMemorySize=1g -XX:SurvivorRatio=10 -XX:+UseConcMarkSweepGC -XX:CMSMaxAbortablePrecleanTime=5000 -XX:+CMSClassUnloadingEnabled -XX:CMSInitiatingOccupancyFraction=80 -XX:+UseCMSInitiatingOccupancyOnly -XX:+ExplicitGCInvokesConcurrent -Dsun.rmi.dgc.server.gcInterval=2592000000 -Dsun.rmi.dgc.client.gcInterval=2592000000 -XX:ParallelGCThreads=4 -Xloggc:$work_dir/logs/gc.log -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=$work_dir/logs/java.hprof -Djava.awt.headless=true -Dsun.net.client.defaultConnectTimeout=10000 -Dsun.net.client.defaultReadTimeout=30000 -DJM.LOG.PATH=$work_dir/logs -DJM.SNAPSHOT.PATH=$work_dir/snapshots -Dfile.encoding=utf-8 "

COPY ./boot/target/online-study.jar  $work_dir

EXPOSE 8006
WORKDIR $work_dir
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar  $work_dir/$app_name.jar"]



