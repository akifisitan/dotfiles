$configPath = "C:\Users\user\AppData\Roaming\Code\User\settings.json"
$targetPath = "C:\Users\user\projects\dotfiles\vscode\settings.json"

Write-Host "Removing $configPath before symlinking"
Remove-Item -Path $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
