#!/bin/bash

# FOSSology Production Deployment Script
# This script deploys FOSSology using pre-built Docker Hub images

set -e

echo "🚀 Starting FOSSology Production Deployment..."

# Check if docker and docker compose are available
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    exit 1
fi

if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    exit 1
fi

# Pull the latest images
echo "📦 Pulling latest images from Docker Hub..."
docker compose -f docker-compose.prod.yml pull

# Start the services
echo "🔄 Starting FOSSology services..."
docker compose -f docker-compose.prod.yml up -d

# Wait for services to be ready
echo "⏳ Waiting for services to be ready..."
sleep 15

# Check if services are running
echo "🔍 Checking service status..."
docker compose -f docker-compose.prod.yml ps

# Test if web interface is accessible
echo "🌐 Testing web interface accessibility..."
if curl -f -s http://localhost:81/ > /dev/null; then
    echo "✅ FOSSology is successfully deployed and accessible!"
    echo "📱 Web Interface: http://localhost:81"
    echo ""
    echo "📋 Management Commands:"
    echo "  View logs: docker compose -f docker-compose.prod.yml logs"
    echo "  Stop services: docker compose -f docker-compose.prod.yml down"
    echo "  Update images: docker compose -f docker-compose.prod.yml pull && docker compose -f docker-compose.prod.yml up -d"
else
    echo "⚠️  Services started but web interface is not yet accessible. Check logs with:"
    echo "   docker compose -f docker-compose.prod.yml logs web"
fi

echo ""
echo "🎉 Deployment completed!"