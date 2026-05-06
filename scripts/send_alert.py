import requests
import os

webhook = os.getenv("SLACK_WEBHOOK_URL")

message = {
    "text": "🚨 Drift Detected in Terraform Infrastructure!\nCheck GitHub Actions logs."
}

requests.post(webhook, json=message)
