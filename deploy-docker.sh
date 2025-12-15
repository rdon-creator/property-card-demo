#!/bin/bash

# Cloud Run deployment script using Docker build
PROJECT_ID="property-card-design-dec2025"
SERVICE_NAME="property-card-demo"
REGION="northamerica-northeast2"
IMAGE_NAME="gcr.io/$PROJECT_ID/$SERVICE_NAME"

echo "Building and deploying to Google Cloud Run..."
echo "Project: $PROJECT_ID"
echo "Service: $SERVICE_NAME"
echo "Region: $REGION"
echo "Image: $IMAGE_NAME"

# Configure Docker to use gcloud as credential helper
gcloud auth configure-docker

# Build the Docker image locally
echo "Building Docker image..."
docker build -t $IMAGE_NAME .

# Push the image to Google Container Registry
echo "Pushing image to GCR..."
docker push $IMAGE_NAME

# Deploy to Cloud Run
echo "Deploying to Cloud Run..."
gcloud run deploy $SERVICE_NAME \
  --image $IMAGE_NAME \
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
