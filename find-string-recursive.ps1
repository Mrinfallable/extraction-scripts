param(
[string]$Path = ".",
[string]$String = "*",
[string]$Output = (New-TemporaryFile),
[string]$Type = "*",
[string]$Len = ($String.length * 5)
)

Get-ChildItem $Path -Recurse -Include "*.$Type" | Select-Object -Property "FullName" | ForEach-Object {
    $path = $_.FullName
    $matchingPath = (findstr /i /m /c:"$String" "$path")
    echo $matchingPath
    if ($null -ne $matchingPath){
        $content = (Get-Content $matchingPath -Raw)
        echo ($content.Substring($content.IndexOf($String), $len))
    }
}
