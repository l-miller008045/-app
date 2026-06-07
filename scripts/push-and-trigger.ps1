param(
    [string]$Branch = "main",
    [switch]$TriggerWorkflow
)

Set-StrictMode -Version Latest
$projectRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition
Write-Host "Project root: $projectRoot"
Push-Location $projectRoot
try {
    Write-Host "Running daily log script..."
    node .\scripts\daily-log.js

    Write-Host "Staging changes..."
    git add .

    $msg = "chore(ci): daily-log update $(Get-Date -Format yyyy-MM-dd_HH-mm)"
    git commit -m $msg 2>$null | Out-Null
    if ($LASTEXITCODE -ne 0) { Write-Host "No local changes to commit." }

    Write-Host "Pulling latest from origin/$Branch..."
    git pull --rebase origin $Branch

    Write-Host "Pushing to origin/$Branch..."
    git push origin $Branch

    if ($TriggerWorkflow) {
        if (Get-Command gh -ErrorAction SilentlyContinue) {
            Write-Host "Triggering GitHub Actions workflow..."
            gh workflow run .github/workflows/daily-log.yml --ref $Branch
        } else {
            Write-Host "gh CLI not found; install GitHub CLI if you want to trigger workflows from script."
        }
    }
    Write-Host "Done."
} catch {
    Write-Error $_.Exception.Message
} finally {
    Pop-Location
}
