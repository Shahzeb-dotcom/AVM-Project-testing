After Creating this repo and setup all these things the follow this step to push repo into Github
git init
git remote add origin https://github.com/Shahzeb-dotcom/ASV-Project-testing.git
git branch -M main
git add .
git commit -m "initial commit"
git push -u origin main
############################################
############################################

# Project folder mein jayein
cd /Users/pro/Desktop/ASV_resource/exceltest

# Virtual environment banayein
python3 -m venv venv

# Virtual environment activate karein
# Mac/Linux pe:
source venv/bin/activate.  #  # Virtual environment activate karein


# Windows pe:
# venv\Scripts\activate

# Ab pandas install karein
pip install pandas openpyxl

# Script run karein
python3 excel-to-tfvars.py


############################################
############################################

exceltest/
├── excel-to-tfvars.py          # Your conversion script ✅
├── resources.xlsx              # Client Excel file ✅  
├── terraform.tfvars            # Auto-generated ✅
├── main.tf                     # Terraform main config
├── variables.tf                # Terraform variables
├── provider.tf                 # Terraform provider
└── venv/                       # Virtual environment

############################################
############################################



🔄 Complete Workflow Summary:
Client → Excel sheet fill karta hai

You → python3 excel-to-tfvars.py run karte hain

Script → terraform.tfvars automatically generate karta hai

Terraform → terraform apply se resources create karta hai

rg_name = ""
rg_location = ""
tags = {
  environment = ""
  project     = ""
}

1. ./ResourceGroup.ps1 -csvPath ./ResourceGroup.csv -tfvarsPath ./terraform.tfvars
for mac i used this one
2. .\Generate-RG-Tfvars.ps1 -csvPath .\ResourceGroup.csv -tfvarsPath .\terraform.tfvars
for windows forward slash

###
Script me variable names CSV ke headers se match karne honge:
###

PS /Users/pro/Desktop/ASV_resource/resource> Import-Csv ./ResourceGroup.csv | Format-Table

ResourceType    ResourceGroupName       Location        Environment     Project
-----------------------------------------------------------
resourcegroup   rg-uat-magnum   CentralIndia    Dev     magnum

PS /Users/pro/Desktop/ASV_resource/resource> 

###
PS /Users/pro/Desktop/ASV_resource/resource> Get-Content ./ResourceGroup.csv | % { "'$_'" }
'ResourceType   ResourceGroupName       Location        Environment     Project'
'resourcegroup  rg-uat-magnum   CentralIndia    Dev     magnum'
PS /Users/pro/Desktop/ASV_resource/resource> 