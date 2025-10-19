param(
    [string]$csvPath = ".\ResourceGroup.csv",
    [string]$tfvarsPath = ".\terraform.tfvars"
)

$data = Import-Csv -Path $csvPath -Encoding UTF8

$rg_tfvars = @()
foreach ($row in $data) {
    $rg_tfvars += @"
rg_name = "${row.ResourceGroupName}"
rg_location = "${row.Location}"
tags = {
  environment = "${row.Environment}"
  project     = "${row.Project}"
}
"@
}

$rg_tfvars | Out-File -FilePath $tfvarsPath -Encoding UTF8
Write-Host "Terraform .tfvars file generated at $tfvarsPath"
