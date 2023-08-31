# Point the script to a text file with a list of computers
$Computers = "D:\MS Patches\servers.txt"

# Specify the destination path where you want to create the folder
$destinationPath = "D:\MS PAtches"

# Check if the destination folder already exists
if (Test-Path -Path $destinationPath) {
    Write-Host "Destination folder already exists."
} else {
    # Create the destination folder
    New-Item -Path $destinationPath -ItemType Directory
    Write-Host "Destination folder created at: $destinationPath"
}

# Sets the variable for the source file location
$Source = "D:\MS Patches\KB5028169.msu"

# Sets the variable for the file destination
$Destination = "\MS Patches\"

# Get the content of $computers and copy Source to Destination
Get-Content $Computers | ForEach-Object{
    Write-Host $_
    Copy-Item $Source -Destination (Join-Path "\\$_\d$"$Destination)
}
