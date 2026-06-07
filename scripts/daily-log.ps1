param()
$dir = "dev_logs"
if (-not (Test-Path $dir)) { New-Item -ItemType Directory -Path $dir }
$file = Join-Path $dir (Get-Date -Format "yyyy-MM-dd") + ".md"
if (-not (Test-Path $file)) {
    @"# 开发日志 - $(Get-Date -Format 'yyyy-MM-dd')

- 完成事项：

- 待办事项：

- 风险/阻塞：

- 次日计划：

- 自动记录： $(Get-Date -Format 'HH:mm')
"@ | Out-File -FilePath $file -Encoding utf8
} else {
    Add-Content -Path $file -Value ("- 自动记录: $(Get-Date -Format 'HH:mm')")
}
Write-Host "Processed $file"
