# Terraform Network Infrastructure Deployment

## Description

This document outlines the process of deploying network infrastructure using Terraform.  Terraform is an Infrastructure as Code (IaC) tool that allows you to define and provision infrastructure in a declarative way.  The advantage of deploying infrastructure with Terraform include:

* **Automation:** Terraform automates the provisioning process, reducing manual errors and increasing efficiency.
* **Version Control:** Terraform configurations can be version-controlled, enabling collaboration, tracking changes, and easy rollbacks.
* **Reusability:** Infrastructure components can be defined as reusable modules, simplifying complex deployments and ensuring consistency.
* **Multi-Cloud Support:** Terraform can manage infrastructure across multiple cloud providers (e.g., AWS, Azure, GCP) using a single configuration language.
* **Planning:** Terraform creates an execution plan before making any changes, allowing you to preview the changes and avoid surprises.

## Prerequisite

Before you begin, you need the following:

I.  **AWS Account**

* You will need an active AWS account with appropriate permissions to create and manage network resources (VPCs, subnets, security groups, etc.).

II. **Terraform Knowledge**
* Basic understanding of Terraform concepts, configuration syntax (HCL), and CLI commands.  You should be familiar with:
    * Terraform configuration files (`.tf` files)
    * Resources, providers, and modules
    * Terraform CLI commands

## Steps to Deploy

The following steps detail how to deploy and tear down network infrastructure using Terraform:

1.  **`terraform init`**:  Initializes the Terraform working directory. This command downloads the necessary provider plugins (e.g., the AWS provider) and sets up the backend for storing the Terraform state.

2.  **`terraform plan`**:  Creates an execution plan.  Terraform compares the desired state (defined in your configuration files) with the current state of your infrastructure (stored in the state file) and determines the changes that need to be made.  The plan shows you exactly what Terraform will do before it does it.

3.  **`terraform apply`**:  Applies the changes described in the execution plan.  Terraform provisions or modifies the network infrastructure resources in your AWS account to match the configuration.

4.  **`terraform destroy`**:  Tears down the deployed infrastructure.  This command reverses the actions of `terraform apply` and deletes all the resources that were created.  It's important to use this command when you no longer need the infrastructure to avoid incurring unnecessary costs.



## Verification

navigate snapshots folder to xheck network pings  and access