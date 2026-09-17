$configPath = "$env:LOCALAPPDATA\Microsoft\VisualStudio\18.0_820f3c9b\settings.json"
$targetPath = "$PSScriptRoot\settings.json"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
