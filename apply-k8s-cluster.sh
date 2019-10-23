#!/bin/bash
kubectl apply -f k8s/00-namespace.yaml
kubectl create secret -n messaging generic vernemq-certifications \
                                        --from-file=./certificate/server.csr \
                                        --from-file=./certificate/server.crt \
                                        --from-file=./certificate/server.key
kubectl create secret -n messaging generic vernemq-passwd \
					--from-file=./vmq.passwd
kubectl apply -f k8s/vernemq-cluster.yaml
