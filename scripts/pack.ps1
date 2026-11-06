# 打包两个技能为可分发的 zip
# 用法：pwsh -File scripts/pack.ps1
# 产物：dist/<skill>.zip（zip 内保留技能目录名，解压到 skills/ 即可用）

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$dist = Join-Path $root 'dist'
$skills = Join-Path $root 'skills'

New-Item -ItemType Directory -Force -Path $dist | Out-Null

$names = @('surveying-robot-paper-writing', 'surveying-project-report')

foreach ($name in $names) {
    $src = Join-Path $skills $name
    if (-not (Test-Path $src)) { throw "缺少技能目录：$src" }
    $zip = Join-Path $dist "$name.zip"
    if (Test-Path $zip) { Remove-Item $zip -Force }
    Compress-Archive -Path $src -DestinationPath $zip -CompressionLevel Optimal
    Write-Output "已打包 $zip"
}

# 合集包
$suite = Join-Path $dist 'surveying-robot-writing-suite.zip'
if (Test-Path $suite) { Remove-Item $suite -Force }
Compress-Archive -Path (Join-Path $skills '*') -DestinationPath $suite -CompressionLevel Optimal
Write-Output "已打包 $suite"

# 校验：每个 zip 内都应有 SKILL.md
Add-Type -AssemblyName System.IO.Compression.FileSystem
foreach ($z in Get-ChildItem $dist -Filter *.zip) {
    $entries = [System.IO.Compression.ZipFile]::OpenRead($z.FullName).Entries.FullName
    $ok = ($entries | Where-Object { $_ -like '*/SKILL.md' }).Count -ge 1
    Write-Output ("{0,-52} SKILL.md: {1}" -f $z.Name, $(if ($ok) { 'OK' } else { '缺失' }))
}
