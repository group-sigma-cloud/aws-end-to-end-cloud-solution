param(
    [Parameter(Mandatory = $true)]
    [string]$Message
)

$ErrorActionPreference = "Stop"

if ($Message.Trim().Length -lt 5) {
    throw "Commit message must contain at least 5 characters."
}

$branch = git branch --show-current

if ($branch -eq "main" -or $branch -eq "develop") {
    throw "Direct commits to main and develop are not allowed."
}

git add -A

if ($LASTEXITCODE -ne 0) {
    throw "Unable to stage changes."
}

$status = git diff --cached --quiet

if ($LASTEXITCODE -eq 0) {
    Write-Host "No changes to commit." -ForegroundColor Yellow
    exit 0
}

if ($LASTEXITCODE -ne 1) {
    throw "Unable to inspect staged changes."
}

git commit -m $Message

if ($LASTEXITCODE -ne 0) {
    throw "Commit failed."
}

Write-Host "Commit completed successfully." -ForegroundColor Green
