**🚀 Packer AMI with Ansible & GitHub Actions**

Overview

This project automates the creation of an AWS AMI using Packer and Ansible, with a CI pipeline powered by GitHub Actions.

The AMI is pre-configured with essential software:

**CloudWatch Agent
AWS SSM Agent
Docker
Git**

**Tools Used**
AWS: Cloud platform for AMI creation
Packer: Builds the custom AMI
Ansible: Manages software provisioning
GitHub Actions: Automates the build pipeline

Project Structure


├── ansible/
│   └── playbook.yml         # Ansible playbook for provisioning
├── packer-ami-golden.pkr.hcl      # Packer template for AMI creation
└── .github/
    └── workflows/
        └── build.yml  # GitHub Actions workflow

**Getting Started**

1. Prerequisites
AWS Account

Packer & Ansible (for local testing)
3. AWS Credentials
Add the following secrets in your GitHub repository:
AWS_ACCESS_KEY_ID
AWS_SECRET_ACCESS_KEY

4. Trigger the Pipeline
Push to the repository and the GitHub Actions workflow will automatically build the AMI.
