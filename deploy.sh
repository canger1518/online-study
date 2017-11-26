#!/bin/bash

IMAGE_NAME=$1:$2
ENV=$3

echo $IMAGE_NAME $ENV

case ${ENV} in
	testing) sed -e "s/IMAGENAME/$IMAGE_NAME/g" -e "s/RUNTIME/$ENV/g" -e 's/containerNum/1/g'  -e "s/APOLLOURL/http:\/\/10.160.2.153:8083/g"  docker-compose.tpl > docker-compose.yml
	;;
	staging) sed -e "s/IMAGENAME/$IMAGE_NAME/g" -e "s/RUNTIME/$ENV/g" -e 's/containerNum/1/g'  -e "s/APOLLOURL/http:\/\/10.160.2.153:8082/g"  docker-compose.tpl > docker-compose.yml
	;;
	release) sed -e "s/IMAGENAME/$IMAGE_NAME/g" -e "s/RUNTIME/$ENV/g" -e 's/containerNum/1/g'  -e "s/APOLLOURL/http:\/\/10.160.2.153:8081/g"  docker-compose.tpl > docker-compose.yml
	;;
	production) sed -e "s/IMAGENAME/$IMAGE_NAME/g" -e "s/RUNTIME/$ENV/g" -e 's/containerNum/3/g'  -e "s/APOLLOURL/http:\/\/10.160.2.153:8081/g"   docker-compose.tpl > docker-compose.yml
	;;
esac