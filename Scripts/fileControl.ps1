function readFile{
    # $ContentsWithLinebreaks2 = Get-Content $FilePath -Raw
    $string = Get-Content $args[0] -Raw
    return $string
}