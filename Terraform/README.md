![download (2)](https://user-images.githubusercontent.com/69889600/209645792-ae792327-304a-4e0a-b841-8fe7aac8762e.jpg)

## What is Terraform?
- Terraform is an open-source infrastructure as a code tool created by HashiCorp, that lets you provision, build, change, and version cloud and on-prem resources. It lets you define both Cloud and on-prem resources in human-readable configuration files that you can version, reuse, and share.

## What is Infrastructure as Code?
- Infrastructure as code (IaC) is the process that allows you to manage infrastructure with configuration files rather than through a graphical user interface. IaaC allows you to build, change, and manage your infrastructure in a safe, consistent, and repeatable way by defining resource configurations that you can version, reuse, and share.

## Why Terraform?

- Manage any Infrastructure
- Track Infrastructure
- Reduce time to provision
- Support multi-cloud Infrastructure deployment
- Automate changes
- Standardize configuration
- Collaboration

## How does Terraform work?

Terraform creates and manages resources on a cloud platform and other services through their APIs. Providers enable Terraform to work with virtually any platform or service with an accessible API.

**Providers are a logical abstraction of an upstream API. They are responsible for understanding API interactions and exposing resources.**
Providers supported by Terraform, there are officially 130 providers supported by Terraform:
- AWS
- Azure
- Google Cloud Platform
- Kubernetes and so on




## Install Terraform

##### Windows

[Download Terraform](https://developer.hashicorp.com/terraform/downloads)
```
Extract the executable to a directory (E.g. c:\terraform)
Go to the Environment variable and update the system variables in the PATH
```

##### Ubuntu/Debian
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```
##### Centos/RHEL

```
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
```
- **Check version**
```
terraform version
```
*Resources are the most important element in the Terraform language. Each resource block describes one or more infrastructure objects, such as virtual networks, compute instances, or higher-level components such as DNS records.*
*Terraform configuration files are written in HCL to deploy infrastructure resources, these files have .tf extensions*

#### Let's get started with Terraform

To use AWS provider and create AWS infrastructure we need to configure AWS CLI
- Install AWS CLI
- Check version :  aws --version
- Create User with permission and configure AWS Access Key and Secret Access Key

 Follow [this article](https://palak-bhawsar.hashnode.dev/launch-an-ec2-instance-using-terraform) to configure AWS CLI

- Create any folder 
```
mkdir terraform-project
```
- Change into this directory
```
cd terraform-project
```
- Create providers.tf file to define provider
#### To specify a specific version of the provider, use required_providers block under terraform.
```
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.35.0"
    }
  }
}
```
- Create ec2.tf file to launch an Instance
```
resource "aws_instance" "my_ec2_instance" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"

  tags = {
    Name = "FirstEC2Instnace"
  }
}
```

**Typical Terraform workflow involves 3 steps - Write, Plan, and Apply**

- This command will check the configuration file and initialize the working directory containing the .tf file and install the required plugins for the provider.
```
terraform init 
```
- This command will show the actions carried out by Terraform to create the resource.
```
terraform plan
```
- This command executes the actions proposed in a terraform plan. It is used to deploy your infrastructure and will ask the user to type yes.
```
terraform apply
```
#### What is Terraform state file?

When we create infrastructure after executing "terraform apply" command. Terraform creates a state file called **terraform.tfstate** this state file contains all the information about the resources created using Terraform. This state file keeps track of resources created by your configuration and maps them to real-world resources. The state file is a sensitive file as it contains information about the infrastructure that we have created. You should never push this file to any version control system like GitHub. 
Store terraform.tfstate file in the backend to keep it safe.

**The backend supported by Terraform:**

- Amazon S3
- Azure Storage
- Google Cloud Storage
- HashiCorp’s Terraform Cloud and Terraform Enterprise.

##### Variables in terraform

variables can be defined in variables.tf file and can be used in configuration files as **var.variable_name**

##### Types of variables
- string ("file")
- bool (true/false)
- number (7)
- any (Default value)

The type constructors allow you to specify complex types such as collections:

- list(<TYPE>)
- set(<TYPE>)
- map(<TYPE>)
- object({<ATTR NAME> = <TYPE>, ... })
- tuple([<TYPE>, ...])


##### How to define variables in variables.tf file using a parameter (default, type, and description)
```
variable "filename" {
   deafult = "test"
   type = string
   description = "configuration file namee"
   sensitive = false
   }
```
**Define environment variables in terraform.tfvars or terraform.tfvars.json**

#### Terraform Commands

- This command will initialize the working directory containing Terraform configuration files and install any required plugins.
```
terraform init
```
- This command lets you preview the actions Terraform would take to modify your infrastructure or save a speculative plan which you can apply later.
```
terraform plan
```
- This command executes the actions proposed in a terraform plan. It is used to deploy your infrastructure. Typically apply should be run after terraform init and terraform plan. Enter yes when prompted "Enter a value:".
```
terraform apply
```
- This command  will show whether the syntax used is correct or not
```
terraform validate
```
- This command scans the configuration files in the current working directory and formats the code. It is used to improve the readability of files.
```
terraform fmt
```
- This command will list all the providers used in the configuration file
```
terraform providers
```
- This command will mirror the provider configuration in a new path.
```
terraform providers mirror /<file_path>
```
- This command will print all the output variables in the configuration files
```
terraform output
```
- This command is used to sync the terraform with real-world resources
```
terraform refresh
```
- This command will show the resources we have created.
```
terraform show
```
- To destroy the infrastructure
```
terraform destroy 
```

#### Terraform Lifecycle Rule

- This is used in the configuration file when you don't want your resources to delete before the creation of new resources
```
lifecycle {
   create_before_destroy = true
   }
```
- This is used in the configuration file when you don't want your old resources to be deleted
```
lifecycle {
   prevent_destroy = true
   }
```
####  Create aliases
```
provider "aws" {
   region = "us-east-1"
   alias = "east"
   }
   
   use it -- aws.east

```
#### Output Variables in Terraform
Output variables are used to store the value of the expression in terraform
```
output "public_ip_addr" {
   value = aws_instance.jenkinsserver.public_ip
   description = "print public ipv4 of Jenkis Server"
   }
```
#### If one resource is dependent on another and we want that resource to be provisioned before use depends_on
```
depends_on = [
     aws_instance.jenkins
     ]
```

