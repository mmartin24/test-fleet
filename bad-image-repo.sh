#!/bin/bash

numberofrepos=200

for i in $(seq 1 $numberofrepos);
do
  mkdir -p bad-image/gitrepo-$i
  cat > bad-image/gitrepo-$i/fleet.yaml <<EOF
defaultNamespace: ns-bad-image-nginx-test-$i
EOF
  cat > bad-image/gitrepo-$i/nginx.yaml <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bad-image-nginx-test-$i
  labels:
    app: nginx
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:x.x.x
        ports:
        - containerPort: 80
EOF
done
