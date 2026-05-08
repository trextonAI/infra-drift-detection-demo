#!/bin/bash
# $1 is the exit code from terraform plan
EXIT_CODE=$1

if [ $EXIT_CODE -eq 2 ]; then
  echo "Drift Detected! Sending Alerts..."

  # 1. Send to MS Teams
  curl -H "Content-Type: application/json" -d '{
    "summary": "Infrastructure Drift Alert",
    "sections": [{
        "activityTitle": "⚠️ Azure Drift Detected",
        "activitySubtitle": "Environment: Production",
        "facts": [{"name": "Status", "value": "Out of Sync"}],
        "markdown": true
    }]
  }' $TEAMS_WEBHOOK_URL

  # 2. Create Jira Ticket
  curl -u "$JIRA_USER_EMAIL:$JIRA_API_TOKEN" \
    -X POST \
    -H "Content-Type: application/json" \
    --data '{
      "fields": {
        "project": {"key": "IT"},
        "summary": "Drift Detected in Azure Prod",
        "description": "Manual changes found. Pipeline run: '${GITHUB_RUN_ID}'",
        "issuetype": {"name": "Task"}
      }
    }' https://$JIRA_DOMAIN.atlassian.net/rest/api/2/issue

else
  echo "No drift detected. Infrastructure is clean."
fi
