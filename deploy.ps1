Write-Host "Survey Application Deployment Script" -ForegroundColor Green
Write-Host "=====================================" -ForegroundColor Green

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "Git repository not found. Please initialize git first:" -ForegroundColor Red
    Write-Host "   git init" -ForegroundColor Yellow
    Write-Host "   git add ." -ForegroundColor Yellow
    Write-Host "   git commit -m 'Initial commit'" -ForegroundColor Yellow
    Write-Host "   git remote add origin <your-github-repo-url>" -ForegroundColor Yellow
    Write-Host "   git push -u origin main" -ForegroundColor Yellow
    exit 1
}

# Check if backend dependencies are installed
if (-not (Test-Path "backend/node_modules")) {
    Write-Host "Installing backend dependencies..." -ForegroundColor Blue
    Set-Location backend
    npm install
    Set-Location ..
}

# Check if frontend dependencies are installed
if (-not (Test-Path "frontend/node_modules")) {
    Write-Host "Installing frontend dependencies..." -ForegroundColor Blue
    Set-Location frontend
    npm install
    Set-Location ..
}

Write-Host "Dependencies installed successfully!" -ForegroundColor Green

Write-Host ""
Write-Host "Deployment Checklist:" -ForegroundColor Cyan
Write-Host "====================" -ForegroundColor Cyan
Write-Host "1. Git repository initialized" -ForegroundColor Green
Write-Host "2. Backend dependencies installed" -ForegroundColor Green
Write-Host "3. Frontend dependencies installed" -ForegroundColor Green
Write-Host ""
Write-Host "Next Steps:" -ForegroundColor Cyan
Write-Host "===========" -ForegroundColor Cyan
Write-Host ""
Write-Host "Option 1: Render (Recommended)" -ForegroundColor Yellow
Write-Host "-----------------------------" -ForegroundColor Yellow
Write-Host "1. Go to https://render.com and create an account" -ForegroundColor White
Write-Host "2. Create a new PostgreSQL database" -ForegroundColor White
Write-Host "3. Deploy backend:" -ForegroundColor White
Write-Host "   - New -> Web Service" -ForegroundColor Gray
Write-Host "   - Connect your GitHub repo" -ForegroundColor Gray
Write-Host "   - Root Directory: backend" -ForegroundColor Gray
Write-Host "   - Build Command: npm install" -ForegroundColor Gray
Write-Host "   - Start Command: npm start" -ForegroundColor Gray
Write-Host "   - Add environment variables (see README.md)" -ForegroundColor Gray
Write-Host ""
Write-Host "4. Deploy frontend:" -ForegroundColor White
Write-Host "   - New -> Static Site" -ForegroundColor Gray
Write-Host "   - Connect your GitHub repo" -ForegroundColor Gray
Write-Host "   - Root Directory: frontend" -ForegroundColor Gray
Write-Host "   - Build Command: npm install && npm run build" -ForegroundColor Gray
Write-Host "   - Publish Directory: build" -ForegroundColor Gray
Write-Host "   - Add REACT_APP_BACKEND_URL environment variable" -ForegroundColor Gray
Write-Host ""
Write-Host "Option 2: Railway" -ForegroundColor Yellow
Write-Host "-----------------" -ForegroundColor Yellow
Write-Host "1. Go to https://railway.app and create an account" -ForegroundColor White
Write-Host "2. Connect your GitHub repository" -ForegroundColor White
Write-Host "3. Deploy backend and frontend as separate services" -ForegroundColor White
Write-Host ""
Write-Host "Option 3: Vercel + Railway" -ForegroundColor Yellow
Write-Host "--------------------------" -ForegroundColor Yellow
Write-Host "1. Deploy backend on Railway" -ForegroundColor White
Write-Host "2. Deploy frontend on Vercel" -ForegroundColor White
Write-Host ""
Write-Host "For detailed instructions, see README.md" -ForegroundColor Cyan
Write-Host ""
Write-Host "Good luck with your deployment!" -ForegroundColor Green
