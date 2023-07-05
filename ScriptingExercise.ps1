# --- Create and Run a Script ---
# In the console:
$ PI = 3.14

# To create a file in the current directory named "PI.ps1" and open it in the code editor
New-Item -Path . -Name "PI.ps1" -ItemType "file"
code PI.ps1 # not the PI.ps1 that exists in this repository - it's the code below

# PI.ps1
$PI = 3
Write-Host "The value of `$PI is now $PI, inside the script"

# Run the file using ./PI.ps1

# Entering $PI in the console will print 3.14
# The script does not change the value of $PI that was declared