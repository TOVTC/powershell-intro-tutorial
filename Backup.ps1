# To run this script ./Backup.ps1 -Path './webapp'
# Including the Path parameter overrides the default string value the parameter is assigned to in the Params

Param(
  [string]$Path = './app',
  [string]$DestinationPath = './'
)
# Checks to see if provided path exists
If (-Not (Test-Path $Path))
{
    Throw "The source directory $Path does nto exist, please specify an existing directory"
}
$date = Get-Date -format "yyyy-MM-dd"
# Create variable to check if file already exists
$DestinationFile = "$($DestinationPath + 'backup-' + $date + '.zip')"
# Check if file already exists
If (-Not (Test-Path $DestinationFile))
{
    Compress-Archive -Path $Path -CompressionLevel 'Fastest' -DestinationPath "$($DestinationPath + 'backup-' + $date)"
    Write-Host "Created backup at $($DestinationPath + 'backup-' + $date + '.zip')"
} Else {
    Write-Error "Today's backup already exists"
}
