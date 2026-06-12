param(
  [string]$RepoName = "dingtalk-zhishen-dingnei-interactive",
  [string]$Visibility = "--public"
)

$ErrorActionPreference = "Stop"

if (-not (Get-Command gh -ErrorAction SilentlyContinue)) {
  throw "GitHub CLI 'gh' is required. Install it first."
}

try { gh auth status | Out-Null } catch { gh auth login }

git init
git branch -M main
git add .
try { git commit -m "Publish DingTalk interactive insight page" } catch { Write-Host "No new changes to commit or commit already exists." }

try {
  gh repo create $RepoName $Visibility --source=. --remote=origin --push
} catch {
  git push -u origin main
}

Write-Host "Repository pushed. In GitHub Settings → Pages, select Source: GitHub Actions if it is not already enabled."
