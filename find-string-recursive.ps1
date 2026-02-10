param(
[string]$Path = ".",
[string]$String = "*",
[string]$Output = (New-TemporaryFile),
[string]$Type = "*",
[string]$Len = ($String.length * 5)
)

#findstr /S "$String" "*.$Type"

Get-ChildItem $Path -Recurse -Include "*.$Type" | Select-Object -Property "FullName" | ForEach-Object {
    $path = $_.FullName

    $matchingPath = (findstr /i /N /m "$String" "$path")
    echo $matchingPath
    if ($null -ne $matchingPath){
        Get-Content $matchingPath | foreach-Object { $_.Substring(0, $len)}
    }

}
