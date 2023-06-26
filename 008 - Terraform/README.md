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


# Terraform variables


**Variable Declaration:** Variables are declared in your Terraform configuration files using the variable block. For example:

```
hcl
variable "region" {
  type    = string
  default = "us-west-1"
}
```

In this example, a variable named "region" is defined with a type of string and a default value of "us-west-1". The type attribute defines the variable's data type, and

the default attribute specifies a default value that will be used if no value is explicitly provided.

**Variable Usage:** You can reference variables in your Terraform code using the interpolation syntax, ${var.<variable_name>}. For example:
```
hcl
resource "aws_instance" "example" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  region        = var.region
}
```

In this case, the value of the region variable is used to specify the region for the AWS instance resource.

**Variable Input:** There are multiple ways to provide variable values when running Terraform commands:

**Command-line flags:** You can use the -var or -var-file flags to set variable values. For example:
```
shell
Copy code
terraform apply -var="region=us-east-1"
```

**Variable files:** You can define a separate file (e.g., variables.tfvars) to store variable values. This file can be referenced using the -var-file flag.\

for Example:
```
shell
terraform apply -var-file="variables.tfvars"
```
**Environment variables:** You can set environment variables with the naming convention TF_VAR_<variable_name>.

For Example:
```
shell
export TF_VAR_region="us-west-2"
terraform apply
```
**Interactive prompts:** If no value is provided through the above methods, Terraform will prompt you for the variable value when running a command.

**Variable Interpolation:** Variables can be interpolated within other strings or expressions using the ${var.<variable_name>} syntax.

For Example
```
hcl
Copy code
output "example_output" {
  value = "The selected region is ${var.region}"
}
```
In this case, the value of the region variable will be included in the output message.

## Infrastructure as Code (IaC): 

Terraform enables you to define your infrastructure using code rather than manual processes. This approach allows you to version, manage, and deploy your infrastructure in a reliable and repeatable manner.

## Declarative Configuration Language:

Terraform uses a declarative language called HashiCorp Configuration Language (HCL). With HCL, you define the desired state of your infrastructure resources, and Terraform takes care of creating or modifying resources to match that state.

## Multi-Cloud and Hybrid Cloud Support: 

Terraform supports multiple cloud providers, including Amazon Web Services (AWS), Microsoft Azure, Google Cloud Platform (GCP), and more. It also works with on-premises data centers, allowing you to manage hybrid cloud environments.

## Resource Provisioning:

With Terraform, you can provision various types of infrastructure resources, such as virtual machines, storage accounts, networks, load balancers, and databases. It abstracts the complexity of interacting with each cloud provider's APIs and provides a unified way to manage resources.

## Dependency Management:

Terraform allows you to define dependencies between resources. It automatically handles resource creation and deletion in the correct order based on their dependencies, ensuring consistent and reliable provisioning.

## State Management: 

Terraform maintains a state file that records the current state of your infrastructure. This state file tracks the resources created by Terraform and helps it understand the desired state during subsequent runs. The state file can be stored locally or remotely, facilitating collaboration and sharing among team members.

## Plan and Apply Workflow:

Terraform follows a two-step workflow. First, you create an execution plan that shows the changes Terraform will make to your infrastructure. Then, you apply the plan to make those changes. This approach allows you to preview the modifications before actually applying them.

## Infrastructure as Versioned Code:

Terraform treats infrastructure as versioned code. You can use version control systems like Git to track changes to your infrastructure configurations over time. This enables collaboration, auditability, and rollbacks to previous configurations if needed.

## Community and Ecosystem:

Terraform benefits from a vibrant community and an extensive ecosystem. You can leverage pre-built modules and providers contributed by the community, making it easier to manage complex infrastructure setups. The ecosystem also includes integrations with other DevOps tools, such as Docker, Kubernetes, and Ansible.

## Extensibility:

Terraform can be extended through plugins and custom providers. You can develop your own providers or use third-party plugins to integrate with additional services or platforms, expanding Terraform's capabilities beyond its core functionality.

## Terraform Cloud:

HashiCorp offers a managed service called Terraform Cloud. It provides additional features like remote state management, collaboration, and a web-based user interface for managing Terraform runs. Terraform Cloud simplifies the adoption and management of Terraform in teams and organizations.

## Open Source and Enterprise Versions:

Terraform is available as an open-source tool with a permissive license. HashiCorp also offers an enterprise version called Terraform Enterprise, which includes advanced features like policy enforcement, private module registries, and enhanced support options for enterprise-grade deployments.











