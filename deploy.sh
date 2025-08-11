#!/bin/bash

echo "🚀 Survey Application Deployment Script"
echo "========================================"

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "❌ Git repository not found. Please initialize git first:"
    echo "   git init"
    echo "   git add ."
    echo "   git commit -m 'Initial commit'"
    echo "   git remote add origin <your-github-repo-url>"
    echo "   git push -u origin main"
    exit 1
fi

# Check if backend dependencies are installed
if [ ! -d "backend/node_modules" ]; then
    echo "📦 Installing backend dependencies..."
    cd backend
    npm install
    cd ..
fi

# Check if frontend dependencies are installed
if [ ! -d "frontend/node_modules" ]; then
    echo "📦 Installing frontend dependencies..."
    cd frontend
    npm install
    cd ..
fi

echo "✅ Dependencies installed successfully!"

echo ""
echo "📋 Deployment Checklist:"
echo "========================"
echo "1. ✅ Git repository initialized"
echo "2. ✅ Backend dependencies installed"
echo "3. ✅ Frontend dependencies installed"
echo ""
echo "🔧 Next Steps:"
echo "=============="
echo ""
echo "Option 1: Render (Recommended)"
echo "-----------------------------"
echo "1. Go to https://render.com and create an account"
echo "2. Create a new PostgreSQL database"
echo "3. Deploy backend:"
echo "   - New → Web Service"
echo "   - Connect your GitHub repo"
echo "   - Root Directory: backend"
echo "   - Build Command: npm install"
echo "   - Start Command: npm start"
echo "   - Add environment variables (see README.md)"
echo ""
echo "4. Deploy frontend:"
echo "   - New → Static Site"
echo "   - Connect your GitHub repo"
echo "   - Root Directory: frontend"
echo "   - Build Command: npm install && npm run build"
echo "   - Publish Directory: build"
echo "   - Add REACT_APP_BACKEND_URL environment variable"
echo ""
echo "Option 2: Railway"
echo "-----------------"
echo "1. Go to https://railway.app and create an account"
echo "2. Connect your GitHub repository"
echo "3. Deploy backend and frontend as separate services"
echo ""
echo "Option 3: Vercel + Railway"
echo "--------------------------"
echo "1. Deploy backend on Railway"
echo "2. Deploy frontend on Vercel"
echo ""
echo "📖 For detailed instructions, see README.md"
echo ""
echo "🎉 Good luck with your deployment!"
