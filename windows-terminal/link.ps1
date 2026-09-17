$configPath = "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
$targetPath = "$PSScriptRoot\settings.json"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
