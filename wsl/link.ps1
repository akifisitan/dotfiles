if (-not $IsWindows) { throw 'Run this script on Windows. .wslconfig belongs in the Windows user profile.' }

$configPath = "$HOME/.wslconfig"
$targetPath = "$PSScriptRoot/.wslconfig"

Write-Host "Removing $configPath before symlinking"
Remove-Item -LiteralPath $configPath -Force -ErrorAction SilentlyContinue

Write-Host "Creating symlink"
New-Item -Path $configPath -ItemType SymbolicLink -Value $targetPath
