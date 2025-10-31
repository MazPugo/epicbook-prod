

EpicBook Production Deployment — Terraform + Ansible (AWS):



This project automates the deployment of the EpicBook web application using:

- Terraform → Provision AWS infrastructure (EC2, Security Group, Key Pair)

- Ansible → Configure server & deploy the EpicBook Node.js app

- Nginx → Reverse proxy to app running on port 8080

  | Layer             | Technology             |
| ----------------- | ---------------------- |
| Infrastructure    | AWS EC2 (Ubuntu 22.04) |
| Configuration     | Ansible                |
| Web Server        | NGINX                  |
| Application       | Node.js (EpicBook App) |
| Database          | MariaDB                |
| Repository Source | GitHub Repo            |

✅ Features

- Automated AWS EC2 setup & SSH access

- Secure Security Group rules (port 22 & 80)

- Automated Node.js + PM2 deployment

- Nginx configured as reverse proxy

- MariaDB installation + seeded schema

- Idempotent Ansible roles

  | Tool      | Version  |
| --------- | -------- |
| Terraform | v1.5+    |
| Ansible   | v2.13+   |
| AWS CLI   | v2       |
| SSH Keys  | Required |

Ensure AWS is authenticated:

aws configure

Deployment Steps:
- Provision AWS Infrastructure (Terraform)
- cd terraform
- terraform init
- terraform plan
- terraform apply
- (Copy the public_ip output)

Deploy App & Server Configuration (Ansible)

Update ansible/inventory.ini with EC2 Public IP.
cd ../ansible
ansible-playbook -i inventory.ini site.yml

Access the Application
Open 
http://<EC2_PUBLIC_IP>

✅ Verification Checklist


| Check                        | Status |
| ---------------------------- | ------ |
| SSH works (key auth)         | ✅      |
| Terraform deploys EC2        | ✅      |
| Ansible installs app & NGINX | ✅      |
| Database seeded with schema  | ✅      |
| EpicBook Dashboard loads     | ✅      |
| Idempotent re-runs           | ✅      |


Troubleshooting:


| Issue             | Fix                                 |
| ----------------- | ----------------------------------- |
| Port 8080 busy    | `sudo kill -9 $(lsof -t -i:8080)`   |
| Nginx not routing | Check `/etc/nginx/sites-available/` |
| EC2 unreachable   | Verify SG allows SSH & HTTP         |
| MySQL errors      | Confirm schema.sql & DB credentials |

Lessons & Notes:

- Learned full CI/CD-style flow

- Ansible roles make deployment clean & repeatable

- Terraform outputs streamline Ansible automation

- Database schema must match ORM models ✅ (fixed Cart columns)
  

  Security Considerations:
  
  | Issue             | Future Fix                              |
| ----------------- | --------------------------------------- |
| SSH open to world | Restrict to office/VPN                  |
| DB on same server | Move to AWS RDS                         |
| No TLS            | Add Let's Encrypt SSL                   |
| Single VM         | Convert to Load Balancer + Auto Scaling |


  





