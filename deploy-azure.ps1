#!/usr/bin/env powershell
<#
.SYNOPSIS
  iShiftAI Azure Static Web App Deployment Script
.DESCRIPTION
  Automates the deployment of iShiftAI website to Azure Static Web Apps
.PARAMETER ResourceGroupName
  Name of the Azure resource group (default: iShiftAI-rg)
.PARAMETER StaticWebAppName
  Name of the static web app (default: ishiftai-website)
.PARAMETER Location
  Azure region (default: eastus)
.PARAMETER CustomDomain
  Your custom domain from GoDaddy (e.g., yourdomain.com)
#>

param(
    [string]$ResourceGroupName = "iShiftAI-rg",
    [string]$StaticWebAppName = "ishiftai-website",
    [string]$Location = "eastus2",
    [string]$CustomDomain = ""
)

# Colors for output
$green = @{ ForegroundColor = "Green" }
$yellow = @{ ForegroundColor = "Yellow" }
$red = @{ ForegroundColor = "Red" }

Write-Host "`n============================================================" -f Cyan
Write-Host "  iShiftAI - Azure Static Web App Deployment Script" -f Cyan
Write-Host "============================================================`n"

# Step 1: Check Azure CLI
Write-Host "Step 1: Checking Azure CLI..." @yellow
if (-not (Get-Command az -ErrorAction SilentlyContinue)) {
    Write-Host "Azure CLI not found. Please install it first." @red
    exit 1
}
Write-Host "Azure CLI is installed" @green

# Step 2: Check Login
Write-Host "`nStep 2: Checking Azure login..." @yellow
$account = az account show 2>$null
if (-not $account) {
    Write-Host "Not logged in. Starting Azure login..." @yellow
    az login
    $account = az account show
}

$accountInfo = $account | ConvertFrom-Json
Write-Host "Logged in as: $($accountInfo.user.name)" @green
Write-Host "  Subscription: $($accountInfo.name)" @green

# Step 3: Create Resource Group
Write-Host "`nStep 3: Creating resource group '$ResourceGroupName'..." @yellow
$rgExists = az group exists --name $ResourceGroupName
if ($rgExists -eq "false") {
    az group create `
        --name $ResourceGroupName `
        --location $Location `
        --output none
    Write-Host "Resource group created" @green
} else {
    Write-Host "Resource group already exists" @green
}

# Step 4: Create Static Web App
Write-Host "`nStep 4: Creating Static Web App '$StaticWebAppName'..." @yellow
$swaExists = az staticwebapp show `
    --name $StaticWebAppName `
    --resource-group $ResourceGroupName `
    --output none 2>$null

if (-not $swaExists) {
    az staticwebapp create `
        --name $StaticWebAppName `
        --resource-group $ResourceGroupName `
        --location $Location `
        --output none
    Write-Host "Static Web App created" @green
} else {
    Write-Host "Static Web App already exists" @green
}

# Step 5: Get deployment details
Write-Host "`nStep 5: Getting deployment information..." @yellow
$swaInfo = az staticwebapp show `
    --name $StaticWebAppName `
    --resource-group $ResourceGroupName | ConvertFrom-Json

$defaultHostname = $swaInfo.defaultHostname
Write-Host "Deployment URL: https://$defaultHostname" @green

# Step 6: Get deployment token
Write-Host "`nStep 6: Getting deployment token..." @yellow
try {
    $token = az staticwebapp secrets list `
        --name $StaticWebAppName `
        --resource-group $ResourceGroupName `
        --query "properties.apiKey" -o tsv 2>$null
    
    if ($token) {
        Write-Host "Deployment token obtained" @green
        Write-Host "  Token: $($token.Substring(0,20))..." @green
    }
} catch {
    Write-Host "Could not retrieve deployment token automatically" @yellow
}

# Step 7: Add custom domain (if provided)
if ($CustomDomain) {
    Write-Host "`nStep 7: Adding custom domain '$CustomDomain'..." @yellow
    try {
        az staticwebapp custom-domain create `
            --name $StaticWebAppName `
            --resource-group $ResourceGroupName `
            --domain-name $CustomDomain `
            --output none
        Write-Host "Custom domain added" @green
        Write-Host "  Complete these steps in GoDaddy:" @yellow
        Write-Host "    1. Add CNAME record:" @yellow
        Write-Host "       Name: www" @yellow
        Write-Host "       Value: $defaultHostname" @yellow
        Write-Host "    2. Wait for DNS propagation (15 min - 48 hours)" @yellow
    } catch {
        Write-Host "Could not add custom domain" @yellow
    }
}

# Step 8: Summary
Write-Host "`n============================================================" -f Cyan
Write-Host "                    DEPLOYMENT SUMMARY" -f Cyan
Write-Host "============================================================`n"

Write-Host "Resource Group:       $ResourceGroupName" @green
Write-Host "Static Web App:       $StaticWebAppName" @green
Write-Host "Default URL:          https://$defaultHostname" @green
Write-Host "Region:               $Location" @green

if ($CustomDomain) {
    Write-Host "Custom Domain:        $CustomDomain" @green
    Write-Host "`nDNS Configuration Needed:" @yellow
    Write-Host "  Type:  CNAME" @yellow
    Write-Host "  Name:  www" @yellow
    Write-Host "  Value: $defaultHostname" @yellow
}

Write-Host "`nYour Static Web App is ready!" @green
Write-Host "`nNext Steps:" @yellow
Write-Host "  1. Deploy your website files" @yellow
Write-Host "  2. Visit: https://$defaultHostname" @yellow

if ($CustomDomain) {
    Write-Host "  3. Configure DNS in GoDaddy" @yellow
    Write-Host "  4. Wait for DNS propagation" @yellow
    Write-Host "  5. Visit: https://$CustomDomain" @yellow
}

Write-Host "`nMore information:" @yellow
Write-Host "  Deployment Guide: See AZURE_DEPLOYMENT_GUIDE.md" @yellow
Write-Host "  Azure Portal: https://portal.azure.com" @yellow
Write-Host ""
