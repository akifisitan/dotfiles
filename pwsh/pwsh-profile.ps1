# Environment variables
$env:PYTHONDONTWRITEBYTECODE="1"

# Aliases
Remove-Alias sp -Force
Remove-Alias gc -Force

Set-Alias -Name c -Value Clear-Host
Set-Alias -Name npp -Value "C:\Program Files\Notepad++\notepad++.exe"
Set-Alias -Name pn -Value pnpm
Set-Alias -Name sp -Value Start-Process -Force

# terminal
function open { Start-Process . }

function th { wt -d . }

function mklink ($target, $link) { New-Item -Path $target -ItemType SymbolicLink -Value $link }

# ts / js
function npr { npm run @args }

function pnx { pnpm dlx @args }

# python
function venv { venv/Scripts/activate }

function .venv { .venv/Scripts/activate }

# git
function ga { git add @args }

function gs { git status @args }

function gr { git reset @args }

function gn { git checkout -b @args }

function gu { git pull @args }

function gp { git push @args }

function gcl {
    git restore . # Discard changes to tracked files
    git clean -fd # Remove untracked files and directories
}


# git branch tab autocomplete
function gc {
    param(
        [Parameter(Mandatory)]
        [ValidateNotNullOrEmpty()]
        [ArgumentCompleter({
            param($pCmd, $pParam, $pWord, $pAst, $pFakes)
            # Get the list of all branches
            $branchList = (git branch --format='%(refname:short)')
            if ([string]::IsNullOrWhiteSpace($pWord)) {
                return $branchList;
            }
            # Filter branches that contain the typed word
            $filteredList = $branchList | Where-Object { $_ -match "$pWord" }
            # Prioritize branches
            $sortedList = $filteredList | Sort-Object -Property @{
                Expression = { 
                    # Exact match gets the highest priority
                    if ($_ -ieq $pWord) { 0 }
                    # Leading matches (e.g., starting with $pWord) come next
                    elseif ($_ -like "$pWord*") { 1 }
                    # Specific branch (e.g., 'develop') gets next priority
                    elseif ($_ -ieq 'develop') { 2 }
                    # All others follow alphabetically
                    else { 3 }
                }
            }, Name
            return $sortedList;
        })]
        [string] $branch
    )

    git checkout $branch 
}

# Prompt
function Prompt {
    $location = Get-Location
    if ($location.Path -eq "C:\") {
      $lastDir = "/"
    } elseif ($location.Path -eq "$HOME") {
      $lastDir = "~" # good enough for now
    } else {
      $lastDir = Split-Path $location -Leaf
    }
    $Host.UI.RawUI.WindowTitle = $lastDir
    "➜  $($lastDir) "
}
