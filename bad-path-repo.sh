#!/bin/bash

numberofrepos=200

for i in $(seq 1 $numberofrepos);
do
  mkdir -p bad-path/gitrepo-$i
  cat > bad-path/gitrepo-$i/fleet.yaml <<EOF
defaultNamespace: ns-bad-path-nginx-test-$i
EOF
  cat > bad-path/gitrepo-$i/nginx.yaml <<EOF
apiVersion: apps/v1
kind: Deployment
metadata:
  name: bad-path-repo-nginx-test-$i
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
        image: nginx:1.14.2
        ports:
        - containerPort: 80
EOF
done
