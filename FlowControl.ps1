# ---Flow Control---
# Sanitize input - ensure parameters being accepted hold reasonable values
# Control execution flow - determines which group of statements runs
# Iterate over data - execute code for each item in a list

# ---If/Else If/Else---
$Value = 3
# -le less than or equal to
If ($Value -le 0)
{
    Write-Host "Is negative"
} Else {
    Write-Host "Is positive"
}

$Status = 'Minor'
If ($Status -eq 'Minor')
{
    Write-Host $False
} ElseIf ($Status -eq 'Adult') {
    Write-Host $True
} Else {
    Write-Host $False
}