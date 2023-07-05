# PI.ps1
$PI = 3.14
Write-Host "The value of `$PI is $PI"

# Run the script by invoking its name and path: ./PI.ps1

# ---Variables---
$PI = 3.14

# Single quotation marks specify literals, double quotation marks allow variables to be interpolated
Write-Host 'Here is $PI'
Write-Host "Here is $PI"

# A backtick escapes the first instance of $PI
Write-Host "Here is `$PI and its value is $PI"

# Expressions can also be written within double quotations
Write-Host "An expression $($PI + 1)"

# ---Scope---
# Scope can be Global (to the system), Script (within a script file), or Local (current scope)
# A script can target global scope by prepending the global keyword
# Scopes can nest and can have parent and child scopes - items are visible in the current and child scopes

# A variable defined directly in the console is global scope
# Running this script file after entering "$test = 'hi'" in the console will allow $test to print

$test