#!/bin/bash

# Variables
CLUSTER_NAME="ullagallu-konkas-tech"
PROFILE="eks"

# Delete EKS cluster
echo "Deleting EKS cluster..."
eksctl delete cluster --name=$CLUSTER_NAME --profile=$PROFILE

# Check if the deletion was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to delete EKS cluster."
    exit 1
fi

echo "EKS cluster deleted successfully."
