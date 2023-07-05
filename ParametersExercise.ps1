# ---Create a Backup Script---
# This was completed in the Azure sandbox provided by Microsoft
# This script will also not directly run - touch is not a standard PowerShell command, its equivalent is New-Item

# Create a directory called app with two files, index.html and app.js
mkdir app
cd app
touch index.html app.js
cd ..

# Start a new instance of PowerShell
pwsh

# Create a new PowerShell script file and open it
touch Backup.ps1
code Backup.ps1

# Compress-Archive uses three parameters
# -Path is the directory of the files you want to compress
# -CompressionLevel specifies how much to compress the files
# -DestinationPath is the path to the resulting compressed file
$date = Get-Date -format "yyyy-MM-dd"
Compress-Archive -Path './app' -CompressionLevel 'Fastest' -DestinationPath "./backup-$date"
Write-Host "Created backup at $('./backup-' + $date + '.zip')"

# Runs the script and compresses the files into a zip
./Backup.ps1

# Backup.ps1 will have the updated code

# Renames app directory to webapp
mv app webapp

# Removes newly created backup
rm backup-2023-07-05.zip