#!/bin/bash

CLUSTER=$1

if [ "$CLUSTER" == "minikube" ]; then
	eval $(minikube docker-env);
	minikube addons enable ingress;
fi

helm dependency build redis/

helm install redis redis/ --values redis/values.yaml

helm install guestbook guestbook/ --values guestbook/values.yaml
