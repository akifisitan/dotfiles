$configPath = "C:\Users\user\.npmrc"
$targetPath = "C:\Users\user\projects\dotfiles\npm\.npmrc"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
