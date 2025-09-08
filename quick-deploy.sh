#!/bin/bash

echo "🚀 One-Click Dashboard Deployment"

# Update URLs with correct username
sed -i 's/your-username/ahmedouardi7/g' dashboard/package.json
sed -i 's/your-username/ahmedouardi7/g' dashboard/.env
sed -i 's/your-username/ahmedouardi7/g' DASHBOARD_CREDENTIALS.md
sed -i 's/your-username/ahmedouardi7/g' ACCESS_DETAILS.md

# Git operations
echo "📦 Pushing to GitHub..."
git add .
git commit -m "Add APISIX Matrix Dashboard"
git push origin main

cd dashboard

# Install and build
npm install
npm run build

# Deploy to GitHub Pages
npm run deploy

echo "✅ Dashboard deployed!"
echo "🌐 Live URL: https://ahmedouardi7.github.io/AOIS_apisix-Project"
