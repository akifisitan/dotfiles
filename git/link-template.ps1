$configPath = "$HOME\.config\git\template"
$targetPath = "$HOME\projects\dotfiles\git\template"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
