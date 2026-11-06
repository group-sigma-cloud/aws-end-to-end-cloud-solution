param(
    [Parameter(Mandatory = $true)]
    [string]$FeatureName
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    throw "Git is not installed or not available in PATH."
}

$branch = "feature/$FeatureName"

if ($FeatureName -notmatch '^[a-z0-9]+(?:-[a-z0-9]+)*$') {
    throw "Use lowercase letters, numbers, and hyphens only."
}

$status = git status --porcelain

if ($LASTEXITCODE -ne 0) {
    throw "Unable to check Git status."
}

if ($status) {
    throw "Working tree is not clean. Commit or stash changes first."
}

git switch develop
if ($LASTEXITCODE -ne 0) {
    throw "Could not switch to develop."
}

git pull --ff-only origin develop
if ($LASTEXITCODE -ne 0) {
    throw "Could not update develop."
}

git switch -c $branch
if ($LASTEXITCODE -ne 0) {
    throw "Could not create feature branch: $branch"
}

Write-Host "Successfully created $branch" -ForegroundColor Green
