online-study:
  image: registry-vpc.cn-hangzhou.aliyuncs.com/canger-all/IMAGENAME
  ports:
    - 8006/tcp
  restart: always
  environment:
    - DOCKER_ENV=RUNTIME
    - CONFIG_SERVER=APOLLOURL
    - APOLLO_TSP_ENV=DOCKER_ENV
    - APOLLO_TSP_URL=CONFIG_SERVER
    - LANG=C.UTF-8
    - JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
    - MAVEN_HOME=/usr/share/maven
    - MAVEN_CONFIG=/root/.m2

  labels:
    aliyun.probe.url: 'tcp://container:8006'
    aliyun.scale: '1'
    aliyun.routing.port_8006: device-platform
    aliyun.log_store_info: /home/admin/online-study/logs/*.log
    aliyun.log_store_error: /home/admin/online-study/logs/error/*.log