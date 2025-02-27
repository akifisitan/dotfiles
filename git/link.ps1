$configPath = "C:\Users\user\.gitconfig"
$targetPath = "C:\Users\user\projects\dotfiles\git\config"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
