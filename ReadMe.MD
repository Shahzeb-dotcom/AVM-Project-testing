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