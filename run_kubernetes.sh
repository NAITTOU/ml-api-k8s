#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=naittou/ml-api
echo $PASSWORD | docker login -u $USERNAME --password-stdin
docker image tag ml-api $dockerpath
docker push $dockerpath

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run udacity-ml-api\
    --image=$dockerpath\
    --port=80 --labels app=udacity-ml-api

# Step 3:
# List kubernetes pods
kubectl get pods 

# Step 4:
# Forward the container port to a host
kubectl port-forward udacity-ml-api 8000:80

