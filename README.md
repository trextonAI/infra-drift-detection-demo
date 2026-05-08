# Azure Infrastructure Drift Detection System

This repository implements an automated **Governance Framework** for Azure using Terraform and GitHub Actions.

###  Features
- **Scheduled Monitoring:** Daily drift checks via Cron jobs.
- **Detailed Analysis:** Uses `terraform plan -detailed-exitcode` to find manual Portal changes.
- **Automated Ticketing:** Creates a **Jira Ticket** automatically when drift is found.
- **Instant Messaging:** Sends a **Microsoft Teams** adaptive card alert.

###  Tech Stack
- **IaC:** Terraform (AzureRM Provider)
- **CI/CD:** GitHub Actions
- **Security:** Azure Service Principal (RBAC)
- **Integrations:** Jira REST API, MS Teams Webhooks
