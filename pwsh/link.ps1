$configPath = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
$targetPath = "$HOME\projects\dotfiles\pwsh\pwsh-profile.ps1"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
