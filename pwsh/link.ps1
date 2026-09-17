$configPath = "$PROFILE"
$targetPath = "$PSScriptRoot/pwsh-profile.ps1"

New-Item -Path (Split-Path $configPath -Parent) -ItemType Directory -Force -ErrorAction Stop | Out-Null

Write-Host "Removing $configPath before symlinking"
Remove-Item -LiteralPath $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
