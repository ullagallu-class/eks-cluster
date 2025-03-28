# eks-cluster creation using aws cli
- create iam user with admin privileges
- install aws cli[https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html]
- install eksctl[https://eksctl.io/installation/]
- install kubectl compatible with eks[https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html#linux_amd64_kubectl]
- run the script [cluster.sh] to create control plane managed by aws
- run the script [node.sh] create to create node group
- run the script [delete.sh] to delete the all the resources 