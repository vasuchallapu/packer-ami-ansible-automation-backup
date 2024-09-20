# packer puglins
# https://www.packer.io/plugins/builders/amazon

packer {
  required_plugins {
    amazon = {
      source  = "github.com/hashicorp/amazon"
      version = "~> 1"
    }
    ansible = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

# Define variables
variable "aws_region" {
  type    = string
  default = "us-east-1"
}

source "amazon-ebs" "ubuntu_ami"{
  region                = var.aws_region
  source_ami            = "ami-0a0e5d9c7acc336f1"
  instance_type         = "t2.micro"
  ssh_username          = "ubuntu"
  ami_name              = "golden-ami-{{timestamp}}"
  ami_description       = "AMI with CloudWatch Agent, SSM Agent, Docker, Git"
  force_deregister      = true
  force_delete_snapshot = true
}

# Provisioners block - Ansible
build {
  sources = ["source.amazon-ebs.ubuntu_ami"]

  provisioner "ansible" {
    playbook_file = "./ansible/playbook.yaml"
    extra_arguments = ["-vvv"]
  }
}  
