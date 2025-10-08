param(
[string]$Path=".",
[string]$String,
[string]$Output="none"
)

if($OutPut -eq "none"){
Get-ChildItem $Path -Recurse -Directory | ForEach-Object {$path = $_.FullName; findstr /i "$String" "$path\*"}
}
else{
Get-ChildItem $Path -Recurse -Directory | ForEach-Object {$path = $_.FullName; findstr /i "$String" "$path\*"} | Out-File -File $Output
}
