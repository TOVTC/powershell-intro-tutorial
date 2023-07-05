# PI.ps1
$PI = 3.14
Write-Host "The value of `$PI is $PI"

# Run the script by invoking its name and path: ./PI.ps1

# Variables
$PI = 3.14

# Single quotation marks specify literals, double quotation marks allow variables to be interpolated
Write-Host 'Here is $PI'
Write-Host "Here is $PI"

# A backtick escapes the first instance of $PI
Write-Host "Here is `$PI and its value is $PI"

# Expressions can also be written within double quotations
Write-Host "An expression $($PI + 1)"