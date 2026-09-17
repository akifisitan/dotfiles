$configPath = "$HOME\.config\mise\config.toml"
$targetPath = "$PSScriptRoot\config.toml"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
