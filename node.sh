#!/bin/bash

# Variables
CLUSTER_NAME="ullagallu-konkas-tech"
REGION="ap-south-1"
NODEGROUP_NAME="ng1"
NODE_TYPE="t3a.medium"
NODES=2
NODES_MIN=1
NODES_MAX=1
NODE_VOLUME_SIZE=20
SSH_PUBLIC_KEY="siva"

# Create nodegroup
eksctl create nodegroup --cluster=$CLUSTER_NAME \
                       --region=$REGION \
                       --name=$NODEGROUP_NAME \
                       --node-type=$NODE_TYPE \
                       --nodes=$NODES \
                       --nodes-min=$NODES_MIN \
                       --nodes-max=$NODES_MAX \
                       --node-volume-size=$NODE_VOLUME_SIZE \
                       --ssh-access \
                       --managed \
                       --asg-access \
                       --external-dns-access
                       

# Check if the nodegroup creation was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to create nodegroup."
    exit 1
fi

echo "Nodegroup created successfully."

# --spot 