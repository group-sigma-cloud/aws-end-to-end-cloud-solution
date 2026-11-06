$ErrorActionPreference = "Stop"

$branch = git branch --show-current

if ($LASTEXITCODE -ne 0) {
    throw "Unable to identify current Git branch."
}

if ($branch -notlike "feature/*") {
    throw "Push blocked. This script only allows feature branches."
}

$status = git status --porcelain

if ($status) {
    throw "Working tree is not clean. Commit your changes first."
}

git push -u origin $branch

if ($LASTEXITCODE -ne 0) {
    throw "Push failed."
}

Write-Host "Successfully pushed $branch to GitHub." -ForegroundColor Green
