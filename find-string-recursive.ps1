param(
[string]$Path = ".",
[string]$String = "*",
[string]$Output = New-TemporaryFile | Select-Object -Property Name,
[string]$Type = "*.*"
)

$dirs=Get-ChildItem
Get-ChildItem $Path -Recurse -Directory | findstr /i "$Type | ForEach-Object {$path = $_.FullName; findstr /i "$String" "$path\*"} | Out-File -File $Output

Write-Output $Output
