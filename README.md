#  Terraform + Ansible Production Infrastructure

A complete production-grade infrastructure deployed on AWS using **Terraform** (Infrastructure as Code) and **Ansible** (Configuration Management), with full monitoring stack.

---

##  Overview

This project demonstrates a real-world DevOps workflow — building, deploying, and monitoring a production infrastructure entirely from code. No manual AWS Console clicks. 100% Infrastructure as Code.

**36 AWS resources** deployed via Terraform, configured via Ansible, and monitored with Prometheus + Grafana.

---

##  Architecture

- **VPC** with 2 Public + 2 Private Subnets across 2 Availability Zones
- **Application Load Balancer** with health checks
- **4 EC2 Instances** — Bastion, 2x App Servers, Monitoring
- **NAT Gateway + Internet Gateway** for high availability
- **5 Security Groups** with least-privilege access
- **S3 Backend** for Terraform state with locking

---

##  Tech Stack

| Category | Technologies |
|----------|--------------|
| **Cloud** | AWS (VPC, EC2, ALB, S3, IAM) |
| **IaC** | Terraform 1.5+ |
| **Config Mgmt** | Ansible 2.13+ |
| **Containers** | Docker + Docker Compose |
| **Web Server** | Nginx (reverse proxy) |
| **App** | Node.js 18 |
| **Monitoring** | Prometheus, Grafana, Alertmanager |
| **Metrics** | Node Exporter |
| **Logs** | Promtail |

---

##  Features

-  36 AWS resources via Terraform (100% IaC)
-  100% Idempotent Ansible playbooks
-  5/5 Prometheus targets UP
-  2/2 ALB targets healthy
-  Real-time Grafana dashboards
-  4 Alert Rules (CPU, Memory, Disk, Instance Down)
-  Private subnets + Bastion host for security
-  S3 remote state with native locking

---

##  Project Structure
terraform-ansible-production-infra/
├── terraform/
│ ├── modules/
│ │ ├── vpc/
│ │ ├── ec2/
│ │ ├── alb/
│ │ └── security-groups/
│ └── environments/
│ └── dev/
├── ansible/
│ ├── inventory/
│ ├── playbooks/
│ └── roles/
│ ├── common/
│ ├── docker/
│ ├── nginx/
│ ├── node-exporter/
│ ├── promtail/
│ └── monitoring/
├── monitoring/
│ ├── prometheus/
│ ├── alertmanager/
│ └── docker-compose.yml
└── docker/
└── app/

##  Prerequisites

- AWS Account with IAM user (programmatic access)
- Terraform >= 1.5.0
- Ansible >= 2.13
- AWS CLI configured (`aws configure`)
- SSH key pair

---


### 1. Clone Repository

```bash
git clone https://github.com/mumair750/terraform-ansible-production-infra.git
cd terraform-ansible-production-infra
