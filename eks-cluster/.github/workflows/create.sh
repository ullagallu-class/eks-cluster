name: Terraform Kubeadm Cluster Creation


on:
   workflow_dispatch:

permissions:
  id-token: write
  contents: read

jobs:
  terraform:
    name: Terraform Apply
    runs-on: ubuntu-latest

    steps:
      - name: Checkout Repository
        uses: actions/checkout@v4
      
      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v4
        with:
          role-to-assume: arn:aws:iam::522814728660:role/sivaramakrishna-konka-iam-github-actions
          role-session-name: GitHubActionsEKS
          aws-region: ap-south-1

      - name: Install AWS CLI
        run: |
          sudo apt update
          sudo apt install -y awscli

      - name: Run EKS Cluster Creation Script
        run: |
          chmod +x create.sh
          chmod +x node.sh
          ./create.sh
          ./node.sh