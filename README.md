# 🚀 Terraform Drift Detection Demo

## 📌 Overview
This project demonstrates an automated Infrastructure Drift Detection system using Terraform and GitHub Actions.

## ⚙️ Features
- Scheduled drift detection (every 6 hours)
- CI/CD pipeline using GitHub Actions
- Slack alerting on drift detection
- Policy as Code (OPA)


## 🧱 Architecture
1. Terraform manages infrastructure
2. GitHub Actions runs `terraform plan`
3. Plan output is analyzed for drift
4. Alerts triggered on mismatch

## 🚀 How to Run

### 1. Clone Repo
```bash
git clone https://github.com/your-username/infra-drift-detection-demo.git
cd infra-drift-detection-demo
