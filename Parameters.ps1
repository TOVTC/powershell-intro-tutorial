# ---Parameters---
# Cmdlets, functions, and scripts all accept parameters
# Use the Param() keyword to declare parameters, separated by commas

Param(
    $Path
)
New-Item $Path # creates a new file at $Path
Write-Host "File $Path was created"

# To run a script with Params - don't directly run this file though because of the Param Checks section
# ./CreateFile.ps1 -Path './newfile.txt'
# ./CreateFile.ps1 -Path './anotherfile.txt'

# ---Add Parameter Checks---
# If/Else - writes and error to the console
Param(
    $Path
)
If (-Not $Path -eq '') {
    New-Item $Path
    Write-Host "File created at path $Path"
} Else {
    Write-Error "Path cannot be empty"
}

# Parameter[] Decorator - prompts input of missing parameter (can also add optional HelpMessage)
# The help message is displayed if the user types !? and interrobang into the console when prompted for a parameter
Param(
    [Parameter(Mandatory, HelpMessage = "Please provide a valid path")]
    $Path
)
New-Item $Path
Write-Host "File created at path $Path"

# Assign Type
Param(
    [string]$Path
)

# These three strategies can be combined