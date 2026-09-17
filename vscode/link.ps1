$configPath = "$env:APPDATA\Code\User\settings.json"
$targetPath = "$PSScriptRoot\settings.json"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
