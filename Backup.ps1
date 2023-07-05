# To run this script ./Backup.ps1 -PathIsWebApp -Path './webapp'
# Including the Path parameter overrides the default string value the parameter is assigned to in the Params
# Include the -PathIsWebApp param to run the web app check

Param(
  [string]$Path = './app',
  [string]$DestinationPath = './',
  # This is a switch parameter, if this parameter is present when the script is invoked, perform a check on the content
  [switch]$PathIsWebApp
)
# Check the switch param
If ($PathIsWebApp -eq $True) {
# Checks if the $PathIsWebApp parameter is provided at runtime
# If it is, it continues to get a list of file extensions from the directory specified by $Path
    Try
    {
    # Here, we use the -match operator, which expects and REGEX pattern and returns a boolean
        $ContainsApplicationFiles = "$((Get-ChildItem $Path).Extension | Sort-Object -Unique)" -match '\.js|\.html|\.css'
        # Evaluates the boolean returned to $ContainsApplicationFiles
        If (-Not $ContainsApplicationFiles) {
        # The source directory is not for a web app
            Throw "Not a web app"
        } Else {
            # The source directory is for a web app
            Write-Host "Source files look good, continuing"
        }
    } Catch {
        Throw "No backup created due to: $($_.Exception.Message)"
    }
}
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

# create a python app to run check that it is not a web app
# mkdir python-app
# cd python-app
# touch script.py
# cd ..

# Running ./Backup.ps1 -PathIsWebApp -Path './python-app' will throw an error