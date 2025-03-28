#!/bin/bash

# Variables
CLUSTER_NAME="ullagallu-konkas-tech"
REGION="ap-south-1"
ZONES="ap-south-1a,ap-south-1b"

# Create EKS cluster
echo "Creating EKS cluster..."
eksctl create cluster --name $CLUSTER_NAME \
                      --region $REGION \
                      --zones $ZONES \
                      --without-nodegroup
if [ $? -ne 0 ]; then
    echo "Error: Failed to create EKS cluster."
    exit 1
fi

# Associate IAM OIDC provider
echo "Associating IAM OIDC provider..."
eksctl utils associate-iam-oidc-provider \
    --region $REGION \
    --cluster $CLUSTER_NAME \
    --approve
if [ $? -ne 0 ]; then
    echo "Error: Failed to associate IAM OIDC provider."
    exit 1
fi

echo "EKS cluster creation process completed successfully."
