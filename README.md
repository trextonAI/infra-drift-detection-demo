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



###  **HLD:The Workflow:**
- Trigger: A Scheduled Azure DevOps Pipeline (Cron Job) runs daily/weekly.
- Execution: The Pipeline runs terraform plan against the Azure Subscription.
- Analysis: A script checks the Plan output. If changes are found (Exit Code 2), the "Alerting Logic" is triggered.
**Integration:**
- Jira API: Creates a "Task" for the DevOps team to review.
- MS Teams Webhook: Sends a "Critical Alert" card to the team channel.



###  **"How exactly does the code do this?"**
#A. The Terraform Exit Code Logic
- In a script, we use the -detailed-exitcode flag.
 -  0 = Succeeded with no changes.
 -  1 = Error.
 -  2 = Succeeded with changes (Drift detected).
#B. The Integration Script (Bash/PowerShell)
-scripts/notify.sh

  
###  **The "Process Flow" Summary**
- Scheduled Trigger: Every night at 12 AM, Azure DevOps wakes up.
- State Comparison: Terraform compares the State File (Azure Blob) with the Live Azure Resources.
- Drift Identification: Terraform finds a manual change (e.g., "Someone added a Public IP to a VM").
- The "Messenger" (The Pipeline):
   -Calls the Jira REST API to log the incident for tracking.
   -Calls the Teams Incoming Webhook to notify the on-call engineer immediately.
- Resolution: The engineer either:
   -Reverts the manual change (Runs terraform apply).
   -Updates the code to match reality.
