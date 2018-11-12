function prompt
{
	$my_path = $(get-location).toString()
		$my_pos = ($my_path).LastIndexOf("\") + 1
		if( $my_pos -eq ($my_path).Length ) {
			$my_path_tail = $my_path
		}
		else { 
			$my_path_tail = ($my_path).SubString( $my_pos, ($my_path).Length - $my_pos )
		}
	$time = $(get-date)
# Write-Host ("ᵁᴥᵁ") -nonewline -foregroundcolor 'Gray'
		$specialChar1 = [Char]0x25ba
		Write-Host ("(chenhao)[") -nonewline -foregroundcolor 'Green'
		Write-Host ($my_path) -nonewline -foregroundcolor 'Cyan'
		Write-Host ("]##") -nonewline -foregroundcolor 'Green'
		Write-Host ($time) -foregroundcolor 'Red'
		Write-Host ($specialChar1) -nonewline -foregroundcolor 'Green'
		Write-Host (">") -nonewline -foregroundcolor 'Magenta'
		Write-Host (">") -nonewline -foregroundcolor 'Red'
		Write-Host (">") -nonewline -foregroundcolor 'Green'
		return " "
}

