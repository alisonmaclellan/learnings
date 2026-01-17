# Generate MkDocs navigation grouped by month
# Run: .\scripts\generate-nav.ps1

$docsPath = Join-Path $PSScriptRoot "..\docs\notes"
$mkdocsPath = Join-Path $PSScriptRoot "..\mkdocs.yml"

# Get all dated markdown files
$notes = Get-ChildItem -Path $docsPath -Filter "*.md" | 
    Where-Object { $_.BaseName -match '^\d{4}-\d{2}-\d{2}$' } |
    ForEach-Object {
        [PSCustomObject]@{
            Date = [datetime]::ParseExact($_.BaseName, "yyyy-MM-dd", $null)
            FileName = $_.Name
            BaseName = $_.BaseName
        }
    } | Sort-Object Date -Descending

# Group by month
$grouped = $notes | Group-Object { $_.Date.ToString("yyyy-MM") }

# Build nav YAML
$navYaml = @"
site_name: Alison's Learnings
site_description: Lightweight public wiki for daily learnings
site_url: https://<your-username>.github.io/<your-repo>/
nav:
  - Home: index.md
  - Notes:
"@

foreach ($month in ($grouped | Sort-Object Name -Descending)) {
    $monthDate = [datetime]::ParseExact($month.Name + "-01", "yyyy-MM-dd", $null)
    $monthLabel = $monthDate.ToString("MMMM yyyy")
    $navYaml += "`n      - $monthLabel`:"
    
    foreach ($note in ($month.Group | Sort-Object Date -Descending)) {
        $navYaml += "`n          - $($note.BaseName): notes/$($note.FileName)"
    }
}

$navYaml += @"

theme:
  name: material
  features:
    - navigation.instant
    - navigation.tracking
    - content.code.copy
markdown_extensions:
  - admonition
  - toc:
      permalink: true
  - tables
  - codehilite
"@

$navYaml | Out-File -FilePath $mkdocsPath -Encoding utf8 -NoNewline
Write-Host "Updated mkdocs.yml with $($notes.Count) notes grouped by month"
