# Check the current execution policy
$executionPolicy = Get-ExecutionPolicy

# If the policy is Restricted, change it to Bypass temporarily
if ($executionPolicy -eq "Restricted") {
    Set-ExecutionPolicy Bypass -Scope Process -Force
}

# Install Chocolatey (choco)
Set-ExecutionPolicy Bypass -Scope Process -Force
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Install OpenSSH using Chocolatey with SSH server feature enabled
choco install --package-parameters="/SSHServerFeature" openssh -y

# Start and enable the SSH server service
Start-Service sshd
Set-Service -Name sshd -StartupType 'Automatic'

# Confirm the SSH server is running
Get-Service sshd

# Revert execution policy if needed (optional)
if ($executionPolicy -eq "Restricted") {
    Set-ExecutionPolicy Restricted -Force
}
