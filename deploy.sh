#!/bin/bash

# Cloud Run deployment script for property-card-demo
PROJECT_ID="property-card-design-dec2025"
SERVICE_NAME="property-card-demo"
REGION="northamerica-northeast2"

echo "Deploying to Google Cloud Run..."
echo "Project: $PROJECT_ID"
echo "Service: $SERVICE_NAME"
echo "Region: $REGION"

# Deploy to Cloud Run using source-based deployment
gcloud run deploy $SERVICE_NAME \
  --source . \
  --project $PROJECT_ID \
  --region $REGION \
  --allow-unauthenticated \
  --port 8080 \
  --memory 512Mi \
  --cpu 1 \
  --max-instances 3 \
  --min-instances 0 \
  --timeout 300

echo "Deployment complete!"
echo "Service URL: https://property-card-demo-983365551964.northamerica-northeast2.run.app/"
