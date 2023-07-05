# ---Error Handling---
# The error handling strategy depends on the kinds of errors that exsit and how severe the error is
# Two types of errors: terminating error, non-terminating error

# ---Terminating Errors---
# Stops execution on the row where the error occurred
# Handled using Try/Catch or Trap
# You can have multiple Catch statements per Try statement
Try {
    # Code to execute
} Catch [System.IO.IOException] {
    Write-Host "Something went wrong"
} Catch {
    Write-Host "Something that isn't an IO Exception went wrong"
} Finally {
    # Performs resource clean up
}

# ---Exception Objects---
# Message - summary of exception
# Stacktrace - commands that ran before the error
# Offending row - which row was running when the error occurred
# Use the built in $_ variable to access the exception property
Try {
    # Code to execute
} Catch [System.IO.IOException] {
    Write-Host "Something IO went wrong: $($_.exception.message)"
} Catch {
    Write-Host "Something else went wrong: $($_.exception.message)"
} Finally {
    # Performs resource clean up
}

# ---Non-Terminating Errors---
# Notifies the user that something is wrong, but the script continues
# Can be upgraded to a terminating error

Try {
    # Using -ErrorAction causes an error that Try/Catch can catch
    Get-Content './file.txt' -ErrorAction Stop
} Catch {
    # Writes the error but continues to execute code
    Write-Error "File can't be found"
}

# Sometimes for business logic, it makes sense to throw an error
Try {
    If ($Path -eq './forbidden')
    {
        throw "Path not allowed"
    }
    # Code to be executed
} Catch {
    Write-Error "$($_.exception.message)" # prints Path not allowed
}