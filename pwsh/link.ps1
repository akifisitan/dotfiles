$configPath = "C:\Users\user\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
$targetPath = "C:\Users\user\projects\dotfiles\pwsh\pwsh-profile.ps1"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
