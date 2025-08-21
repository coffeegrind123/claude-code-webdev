#!/bin/bash

set -e

echo "🚀 Starting Web Development Environment..."
echo ""

# Generate unique project ID
PROJECT_ID="project_$(date +%Y%m%d_%H%M%S)"
export PROJECT_ID

echo "📁 Project Directory: ./projects/$PROJECT_ID"
echo "🌐 Dev Server: http://host.docker.internal:5173"
echo "📦 Tech Stack: React 18 + Vite + Tailwind CSS"
echo ""

# Ensure projects directory exists
mkdir -p "./projects"

# Create project directory with proper permissions
mkdir -p "./projects/$PROJECT_ID"

# Verify directory was created successfully
if [ ! -d "./projects/$PROJECT_ID" ]; then
    echo "❌ Error: Failed to create project directory ./projects/$PROJECT_ID"
    exit 1
fi

echo "🐳 Building and starting Docker container..."

# Create .env file for docker-compose
echo "PROJECT_ID=$PROJECT_ID" > .env

# Build and start container
docker compose up --build -d

echo ""
echo "⏳ Initializing project (this may take a minute)..."

# Wait for initialization to complete
sleep 45

echo ""
echo "✅ Environment ready!"
echo ""
echo "📋 Next steps:"
echo "  • Open http://host.docker.internal:5173 in your browser"
echo "  • Edit files in ./projects/$PROJECT_ID/"
echo "  • Changes will hot-reload automatically"
echo ""
echo "🛑 To stop: docker compose down"
echo ""

echo "🔍 Checking server status..."
if curl -s http://host.docker.internal:5173 > /dev/null 2>&1; then
    echo "✅ Development server is running at http://host.docker.internal:5173"
else
    echo "⏳ Server is still starting... (check logs: docker compose logs -f web-dev)"
fi

echo ""
echo "🔄 Files should now be available in ./projects/$PROJECT_ID/"
echo "📝 The bind mount syncs changes automatically with hot reload"