# 🚀 iShiftAI Azure Deployment - Complete Instructions

## ✅ What Has Been Created

Your iShiftAI website is ready to deploy to Azure Static Web Apps with GoDaddy domain integration.

**Files Created:**
- ✅ `AZURE_DEPLOYMENT_GUIDE.md` - Complete step-by-step guide
- ✅ `deploy-azure.ps1` - Automated PowerShell deployment script

---

## 🚀 FASTEST WAY: Run Deployment Script (5 minutes)

### Prerequisites:
- Azure CLI installed
- Azure subscription
- GoDaddy domain registered

### Run the Script:

**With Default Settings:**
```powershell
cd c:\Workfolder\iShiftAI-website
.\deploy-azure.ps1
```

**With Custom Domain:**
```powershell
.\deploy-azure.ps1 -CustomDomain "yourdomain.com"
```

**With Custom Names:**
```powershell
.\deploy-azure.ps1 `
  -ResourceGroupName "MyResourceGroup" `
  -StaticWebAppName "my-website" `
  -Location "westus" `
  -CustomDomain "yourdomain.com"
```

The script will:
1. ✅ Check Azure CLI installation
2. ✅ Authenticate with Azure
3. ✅ Create resource group
4. ✅ Create Static Web App
5. ✅ Get deployment URL
6. ✅ Add custom domain (if provided)
7. ✅ Show summary with next steps

---

## 📋 MANUAL WAY: Step-by-Step Commands

If you prefer to run commands manually, see `AZURE_DEPLOYMENT_GUIDE.md` for detailed instructions.

**Quick Commands:**
```powershell
# Login to Azure
az login

# Create resource group
az group create --name iShiftAI-rg --location eastus

# Create static web app
az staticwebapp create `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --location eastus

# Get your URL
az staticwebapp show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --query defaultHostname -o tsv

# Add custom domain
az staticwebapp custom-domain create `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --domain-name "yourdomain.com"
```

---

## 📤 Deploy Your Website Files

### Option 1: GitHub Actions (Recommended)

**Easiest for continuous updates:**

1. Push code to GitHub:
```powershell
cd c:\Workfolder\iShiftAI-website
git init
git add .
git commit -m "Initial commit"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/ishiftai-website.git
git push -u origin main
```

2. Connect GitHub to Azure Static Web App:
```powershell
az staticwebapp create `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --source https://github.com/YOUR_USERNAME/ishiftai-website `
  --branch main `
  --app-location "." `
  --token YOUR_GITHUB_TOKEN
```

3. GitHub Actions will automatically deploy on every push!

### Option 2: Using SWA CLI (Simple)

```powershell
# Install Static Web Apps CLI (one time)
npm install -g @azure/static-web-apps-cli

# Get deployment token
$token = az staticwebapp secrets list `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --query "properties.apiKey" -o tsv

# Deploy
cd c:\Workfolder\iShiftAI-website
swa deploy --deployment-token $token --env production
```

### Option 3: Azure Portal (Easiest)

1. Go to Azure Portal (https://portal.azure.com)
2. Find your Static Web App: ishiftai-website
3. Go to "Deployment" or "Upload folder"
4. Select your website folder
5. Click Upload

---

## 🌐 Connect GoDaddy Domain

### In Azure:
```powershell
# Add your domain
az staticwebapp custom-domain create `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --domain-name "yourdomain.com"

# Get verification details (if needed)
az staticwebapp custom-domain show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --domain-name "yourdomain.com"
```

### In GoDaddy:

1. Log in to GoDaddy.com
2. Go to "My Products" → "Domains"
3. Select your domain
4. Click "DNS" or "Manage DNS"
5. Add CNAME record:
   - **Name**: www
   - **Value**: ishiftai-website.azurestaticapps.net
   - **TTL**: 3600

6. Save and wait 15 min - 48 hours for propagation

---

## ✅ Testing Your Deployment

### Test Azure URL:
```powershell
# Get your Azure URL
$url = az staticwebapp show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --query defaultHostname -o tsv

# Open in browser
Start-Process "https://$url"
```

### Test Custom Domain:
```powershell
# Check DNS propagation
nslookup yourdomain.com
nslookup www.yourdomain.com

# Visit in browser
Start-Process "https://www.yourdomain.com"
```

---

## 📊 Monitor Your Deployment

```powershell
# View deployment logs
az staticwebapp show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg

# List all deployments
az staticwebapp environments list `
  --name ishiftai-website `
  --resource-group iShiftAI-rg

# Get deployment URL
az staticwebapp show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --query defaultHostname
```

---

## 🔄 Update Your Website

### If using GitHub Actions:
1. Edit files locally
2. Commit and push:
   ```powershell
   git add .
   git commit -m "Update website"
   git push
   ```
3. GitHub Actions deploys automatically (2-3 minutes)

### If using manual deployment:
1. Edit files locally
2. Re-run deploy command
3. Changes live immediately

---

## 💰 Pricing (FREE!)

Azure Static Web Apps Free tier includes:
- ✅ Unlimited bandwidth
- ✅ 100 GB storage
- ✅ Free SSL/TLS certificate
- ✅ Free CDN globally
- ✅ 1 free custom domain
- ✅ 100 free API calls/day with Azure Functions

**Perfect for your website!**

---

## 🔐 Security Features Included

✅ **HTTPS** - Free SSL/TLS certificate (automatic)
✅ **CDN** - Global content delivery (automatic)
✅ **DDoS Protection** - Included with Azure
✅ **Web Application Firewall** - Available (paid add-on)
✅ **API Authentication** - Built-in

---

## 🆘 Troubleshooting

### Issue: Azure CLI not found
**Fix:**
```powershell
# Install Azure CLI
# Windows: Download from https://aka.ms/installazurecliwindows
# Or using chocolatey:
choco install azure-cli
```

### Issue: Not logged in
**Fix:**
```powershell
az login
# Or with device code:
az login --use-device-code
```

### Issue: Resource group creation fails
**Fix:**
```powershell
# List your subscriptions
az account list -o table

# Set the correct subscription
az account set --subscription "YOUR_SUBSCRIPTION_ID"
```

### Issue: Website not showing
**Fix:**
1. Wait 2-3 minutes for initial deployment
2. Check deployment status in Azure Portal
3. Verify files are in root directory
4. Check for `index.html` in deployment

### Issue: Custom domain not working
**Fix:**
1. Verify CNAME in GoDaddy points to: `ishiftai-website.azurestaticapps.net`
2. Wait 24-48 hours for DNS propagation
3. Check with: `nslookup yourdomain.com`
4. Clear browser cache (Ctrl+Shift+Delete)

---

## 📞 Support & Resources

**Azure:**
- Static Web Apps Docs: https://learn.microsoft.com/azure/static-web-apps
- Azure Portal: https://portal.azure.com
- Azure CLI Docs: https://learn.microsoft.com/cli/azure

**GoDaddy:**
- GoDaddy Help: https://godaddy.com/help
- DNS Management: https://account.godaddy.com

**Deployment Guides:**
- See: `AZURE_DEPLOYMENT_GUIDE.md` (detailed step-by-step)
- See: `README.md` (general website information)

---

## 🎯 Quick Reference

| Command | Purpose |
|---------|---------|
| `.\deploy-azure.ps1` | One-click deployment |
| `az login` | Authenticate with Azure |
| `az staticwebapp create` | Create Static Web App |
| `az staticwebapp show` | View deployment details |
| `git push` | Deploy with GitHub Actions |
| `swa deploy` | Deploy with SWA CLI |

---

## 📈 What's Included

✅ iShiftAI website files (HTML, CSS, JavaScript)
✅ 5 professional pages
✅ 5 SVG illustrations
✅ Responsive design
✅ Contact form
✅ SEO optimized
✅ Azure deployment automation
✅ Complete documentation
✅ Troubleshooting guide
✅ Cost-free hosting (Free tier)

---

## 🚀 Next Steps

1. **Complete Azure Login** (in browser)
2. **Run Deployment Script**: `.\deploy-azure.ps1`
3. **Deploy Website Files** (GitHub or manual)
4. **Configure GoDaddy DNS** (add CNAME)
5. **Wait for DNS Propagation** (15 min - 48 hours)
6. **Visit Your Live Website** 🎉

---

## 📅 Timeline

- **5 min**: Run deployment script
- **5 min**: Deploy website files
- **1 min**: Add custom domain in Azure
- **5 min**: Configure DNS in GoDaddy
- **15 min - 48 hours**: DNS propagation
- **Total**: Website live in < 30 minutes (or up to 48 hours for DNS)

---

## ✨ After Launch

1. **Monitor**: Check Azure Portal for stats
2. **Update**: Make changes locally, push to GitHub
3. **Scale**: Free tier handles millions of requests
4. **Add Features**: Enable API, add serverless functions
5. **Grow**: Add more pages, content, functionality

---

**Status**: ✅ Ready to Deploy
**Date**: January 27, 2026

🎉 Your iShiftAI website is ready for Azure!

---

## 🎓 Learn More

For complete details with examples and screenshots, see:
- `AZURE_DEPLOYMENT_GUIDE.md` - Full deployment guide
- `CUSTOMIZATION_GUIDE.md` - Website customization
- `README.md` - Website documentation

Good luck with your iShiftAI enterprise AI consulting website! 🚀
