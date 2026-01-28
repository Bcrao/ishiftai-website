# iShiftAI Static Web App Deployment Guide - Azure + GoDaddy Domain

## 📋 Complete Deployment Steps

This guide walks you through deploying your iShiftAI website to Azure Static Web Apps and connecting your GoDaddy domain.

---

## 🔐 Step 1: Login to Azure (Complete in Your Browser)

The browser login has been initiated. Please:
1. Complete the login in your web browser
2. Return to the terminal once authenticated
3. You should see your subscription information

**If browser doesn't open**, use device code flow:
```powershell
az login --use-device-code
```

---

## 📦 Step 2: Create Azure Static Web App Resource

Once logged in, run these commands:

### 2a. Create a Resource Group
```powershell
az group create `
  --name iShiftAI-rg `
  --location eastus
```

**Expected Output:**
```
{
  "id": "/subscriptions/xxx/resourceGroups/iShiftAI-rg",
  "name": "iShiftAI-rg",
  "properties": {
    "provisioningState": "Succeeded"
  }
}
```

### 2b. Create Static Web App Resource
```powershell
az staticwebapp create `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --source https://github.com/YOUR_USERNAME/iShiftAI-website `
  --location eastus `
  --branch main `
  --app-location "." `
  --output-location "./" `
  --token YOUR_GITHUB_TOKEN
```

**NOTE**: You need:
- **GitHub Repository**: Your website files hosted on GitHub
- **GitHub Token**: Personal access token from GitHub
- **YOUR_USERNAME**: Your GitHub username

**OR deploy directly without GitHub (simpler):**

```powershell
az staticwebapp create `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --location eastus
```

This creates the resource. You'll get output with:
- `defaultHostname`: Your temporary Azure URL (ishiftai-website.azurestaticapps.net)
- `name`: ishiftai-website

---

## 📂 Step 3: Deploy Website Files to Azure

### Option A: Using Azure CLI (Direct Upload)

```powershell
# Set variable
$appName = "ishiftai-website"

# Get deployment token
$token = az staticwebapp secrets list `
  --name $appName `
  --resource-group iShiftAI-rg `
  --query "properties.apiKey" -o tsv

# Install Stattic Web Apps CLI (one time)
npm install -g @azure/static-web-apps-cli

# Deploy
swa deploy `
  --deployment-token $token `
  --env production
```

### Option B: Using GitHub Actions (Recommended for Continuous Deployment)

1. **Push your code to GitHub:**
   ```powershell
   cd c:\Workfolder\iShiftAI-website
   git init
   git add .
   git commit -m "Initial iShiftAI website commit"
   git branch -M main
   git remote add origin https://github.com/YOUR_USERNAME/iShiftAI-website.git
   git push -u origin main
   ```

2. **Azure Static Web Apps automatically creates a GitHub Actions workflow**
   - It will be in `.github/workflows/azure-static-web-apps-*.yml`
   - This workflow automatically deploys your site when you push changes

### Option C: Manual ZIP Upload to Azure Portal

1. Compress your website folder (c:\Workfolder\iShiftAI-website) as `website.zip`
2. Go to Azure Portal → Static Web Apps → ishiftai-website
3. Go to "Deployment" → "Choose a deployment source" → "Upload folder"
4. Select your ZIP file and upload

---

## 🌐 Step 4: Test Azure Deployment

Once deployed, test your site:

```powershell
# Get your default Azure URL
az staticwebapp show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --query "defaultHostname" -o tsv
```

This will show: `ishiftai-website.azurestaticapps.net`

**Visit**: https://ishiftai-website.azurestaticapps.net in your browser

You should see your iShiftAI website!

---

## 🔗 Step 5: Configure GoDaddy Domain

Now connect your registered domain to Azure.

### 5a. Get Azure Custom Domain Information

```powershell
# Get your Static Web App details
az staticwebapp show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg
```

**You need:**
- Azure domain (example: ishiftai-website.azurestaticapps.net)
- Verification token (provided by Azure)

### 5b. Add Custom Domain to Azure Static Web App

```powershell
# Replace with YOUR domain
$customDomain = "yourdomain.com"

az staticwebapp custom-domain create `
  --name ishiftai-website `
  --resource-group iShiftAI-rg `
  --domain-name $customDomain
```

Azure will provide:
1. **Custom Domain Verification ID** (looks like: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx)
2. **CNAME Target**: ishiftai-website.azurestaticapps.net

---

## 🔄 Step 6: Update GoDaddy DNS Settings

### 6a. Log into GoDaddy

1. Go to https://godaddy.com
2. Sign in to your account
3. Go to "My Products" → "Domains"
4. Find and select your iShiftAI domain
5. Click "DNS" tab

### 6b. Add CNAME Record for WWW subdomain

1. **Add CNAME Record:**
   - **Name**: `www` (just www, not the full domain)
   - **Value**: `ishiftai-website.azurestaticapps.net`
   - **TTL**: 3600 (or default)

2. **Save Changes**

### 6c. Add TXT Record for Domain Verification (if required)

If Azure requires verification:

1. **Add TXT Record:**
   - **Name**: `@` (your domain root) or the subdomain Azure specifies
   - **Value**: [Verification ID from Azure]
   - **TTL**: 3600

2. **Save Changes**

### Example GoDaddy DNS Settings:
```
Type    | Name          | Value
--------|---------------|------------------------------------------
CNAME   | www           | ishiftai-website.azurestaticapps.net
TXT     | @             | [Azure Verification Token if needed]
A       | @             | [Your IP - managed by Azure or GoDaddy]
```

---

## ⏱️ Step 7: Wait for DNS Propagation

DNS changes can take 24-48 hours to fully propagate, but usually it's much faster (15 minutes to a few hours).

### Check Propagation:

```powershell
# Test if DNS is updated
nslookup yourdomain.com
nslookup www.yourdomain.com
```

Both should eventually resolve to Azure's IP address.

---

## ✅ Step 8: Verify Domain Connection in Azure

Once DNS is updated, verify in Azure:

```powershell
# Check custom domain status
az staticwebapp custom-domain show `
  --name ishiftai-website `
  --domain-name yourdomain.com `
  --resource-group iShiftAI-rg
```

**Status should show**: `Validated` or `Active`

---

## 🎉 Complete! Your Website is Live

Once DNS propagates and verification completes:

✅ Visit `https://www.yourdomain.com` - Your iShiftAI website
✅ Visit `https://yourdomain.com` - Also works (with proper forwarding)
✅ HTTPS enabled automatically (free SSL/TLS certificate)
✅ CDN and caching enabled automatically

---

## 🔧 Post-Deployment: Making Updates

### To Update Your Website:

**If using GitHub Actions:**
1. Edit files locally
2. Commit and push to GitHub
3. GitHub Actions automatically deploys (takes 2-3 minutes)

**If using manual deployment:**
1. Edit files locally
2. Re-upload using one of the deployment methods above

---

## 📊 Monitoring & Configuration

### View Your Static Web App:

```powershell
# See all static web apps
az staticwebapp list --resource-group iShiftAI-rg

# Get full details
az staticwebapp show `
  --name ishiftai-website `
  --resource-group iShiftAI-rg
```

### Configure Environment Variables (if needed):

```powershell
az staticwebapp environment list `
  --name ishiftai-website `
  --resource-group iShiftAI-rg
```

---

## 🚨 Troubleshooting

### Issue: Website shows 404 or "Default Azure Page"

**Solution:**
1. Ensure files are in root directory of deployment
2. Verify `index.html` is present
3. Check deployment logs in Azure Portal
4. Re-deploy files

### Issue: Custom domain not resolving

**Solution:**
1. Wait 24-48 hours for DNS propagation
2. Check GoDaddy DNS settings are correct
3. Verify CNAME points to: `ishiftai-website.azurestaticapps.net`
4. Use `nslookup yourdomain.com` to verify

### Issue: HTTPS Certificate Error

**Solution:**
1. Azure provides free SSL automatically
2. Wait a few minutes after domain is verified
3. Try accessing with `https://` protocol
4. Clear browser cache (Ctrl+Shift+Delete)

### Issue: Can't connect to Azure CLI

**Solution:**
```powershell
# Re-login
az login

# Check current subscription
az account show

# Set subscription if multiple
az account set --subscription "YOUR_SUBSCRIPTION_ID"
```

---

## 📋 Quick Command Reference

```powershell
# Create resource group
az group create --name iShiftAI-rg --location eastus

# Create static web app
az staticwebapp create --name ishiftai-website --resource-group iShiftAI-rg --location eastus

# Get deployment URL
az staticwebapp show --name ishiftai-website --resource-group iShiftAI-rg --query defaultHostname

# Add custom domain
az staticwebapp custom-domain create --name ishiftai-website --resource-group iShiftAI-rg --domain-name yourdomain.com

# Get custom domain status
az staticwebapp custom-domain show --name ishiftai-website --resource-group iShiftAI-rg --domain-name yourdomain.com

# Delete (if needed)
az group delete --name iShiftAI-rg --yes
```

---

## 💰 Pricing

Azure Static Web Apps Free Tier includes:
- ✅ Unlimited bandwidth
- ✅ 100 GB storage
- ✅ Free SSL/TLS
- ✅ Free CDN
- ✅ 1 free custom domain

**Perfect for your website!**

---

## 📞 Support Resources

- Azure Static Web Apps Docs: https://learn.microsoft.com/azure/static-web-apps
- GoDaddy DNS Help: https://godaddy.com/help
- Azure CLI Reference: https://learn.microsoft.com/cli/azure

---

**Status**: Ready for Deployment
**Date**: January 27, 2026
**Next Step**: Complete Azure login and follow Steps 2-8 above
