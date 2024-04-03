# Set execution policy to RemoteSigned for the current session
Set-ExecutionPolicy RemoteSigned -Scope Process

# Get Product ID
Write-Host "Product ID:"
Get-WmiObject -Query "Select * from Win32_OperatingSystem" | ForEach-Object {Write-Host $_.SerialNumber}

# Get Serial Number of Device
Write-Host "Serial Number:"
Get-WmiObject -Class Win32_BIOS | ForEach-Object {Write-Host $_.SerialNumber}

# Get SSD Information
Write-Host "SSD Information:"
Get-PhysicalDisk | Where-Object {$_.MediaType -eq "SSD"} | ForEach-Object {
    Write-Host "Model: $($_.Model) - Size: $([math]::round($_.Size / 1GB)) GB"
}

# Get RAM Size
Write-Host "RAM Size:"
Get-WmiObject -Query "Select * from Win32_ComputerSystem" | ForEach-Object {Write-Host "$([math]::round($_.TotalPhysicalMemory / 1GB)) GB"}

# Get Processor Information
Write-Host "Processor Information:"
Get-WmiObject -Query "Select * from Win32_Processor" | ForEach-Object {Write-Host $_.Name}

# Prompt the user with a message before exit
Write-Host "-----------------------------------------------------"
Read-Host -Prompt "Press Enter to Exit"