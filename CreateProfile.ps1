# ---Profile Creation---
# This was completed in the Azure sandbox provided by Microsoft
# Use Caution when running this file locally - it will overwrite existing profiles

# Starts a PowerShell session
pwsh

# Selects and displays all Profile types and the paths associated with them
$Profile | Select-Object *

# Create a profile for the current user and the current host
New-Item `
  -ItemType "file" `
  -Value 'Write-Host "Hello <replace with your name>, welcome back" -foregroundcolor Green ' `
  -Path $Profile.CurrentUserCurrentHost -Force

# This new profile will be run when a new PowerShell shell is run