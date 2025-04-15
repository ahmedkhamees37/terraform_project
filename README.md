# 🌩️ AWS Infrastructure Deployment with Terraform 

Welcome to my project, where I designed and deployed a **high-availability cloud infrastructure** within a single AWS region across two Availability Zones using **Terraform** and **Jenkins**. This setup ensures **scalability**, **reliability**, and **automated deployments**.

---

## 📋 Project Overview

This project includes:

- **Networking**: VPC setup with public and private subnets, route tables, and gateways  
- **Compute**: EC2 instances for Bastion and Application servers with appropriate security groups  
- **Environment Setup**: Separate workspaces for development and production  
- **Database**: Provisioning of RDS and ElastiCache services  
- **Deployment**: Automated deployment of a Node.js application using Jenkins  
- **Notifications**: SES and Lambda integration for state change alerts  

---

## 🛠️ Infrastructure Components

### 🔧 Networking

- **VPC**: Custom Virtual Private Cloud spanning two Availability Zones  
- **Subnets**: Public and private subnets in each Availability Zone  
- **Internet Gateway**: Facilitates internet access for public subnets  
- **Route Tables**: Separate route tables for public and private subnets with proper associations  

### 🖥️ Compute

#### Security Groups

- **Bastion Host**: Allows SSH access from anywhere  
- **Application Server**: Allows SSH and application port access from within the VPC  

#### EC2 Instances

- **Bastion Host**: Deployed in the public subnet  
- **Application Server**: Deployed in the private subnet  

### 🌐 Environment Setup

- **Workspaces**: `dev` and `prod` for environment isolation  
- **Variable Definitions**: Separate `.tfvars` files for each environment  
- **Modules**: Modularized network components for reusability  
- **Regions**: Deployment within a single AWS region across two Availability Zones  
- **Provisioners**: `local-exec` to output Bastion Host public IP  
- **Version Control**: Infrastructure code maintained in this GitHub repository  
- **CI/CD**: Jenkins pipeline accepts environment parameters to apply Terraform configurations  

### 🔔 Notifications

- **SES**: Verified email setup for notifications  
- **Lambda**: Sends email notifications on Terraform state file changes  

### 🗄️ Database

- **Amazon RDS**: Managed relational database service  
- **ElastiCache**: In-memory data store for caching  

---

## 🚀 Deployment

- **Jenkins**: Automates the deployment of a Node.js application to the Application Server  

---

## 📦 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/ahmedkhamees37/terraform_project.git
cd terraform_project

### 2. Initialize Terraform
bash
Copy
Edit
terraform init
