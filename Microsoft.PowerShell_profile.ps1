. "D:\文档\WindowsPowerShell\Scripts\ahk.ps1"
. "D:\文档\WindowsPowerShell\Scripts\prompt.ps1"
. "D:\文档\WindowsPowerShell\Scripts\matlab.ps1" 
. "D:\文档\WindowsPowerShell\Scripts\ps.ps1"
. "D:\文档\WindowsPowerShell\Scripts\nox.ps1"
. "D:\文档\WindowsPowerShell\Scripts\android.ps1"
. "D:\文档\WindowsPowerShell\Scripts\task.ps1"
. "D:\文档\WindowsPowerShell\Scripts\fileControl.ps1"
. "D:\文档\WindowsPowerShell\Scripts\setEnv.ps1"
. "D:\文档\WindowsPowerShell\Scripts\Split-Merge-File.ps1"
. "D:\文档\WindowsPowerShell\Scripts\mysql.ps1"
. "D:\文档\WindowsPowerShell\Scripts\git.ps1"
# variable set

$vim= 'C:\Program Portable\Vim\_vimrc'


$host_path = "C:\Windows\System32\drivers\etc\hosts"
$choco = "C:\ProgramData\chocolatey\logs\chocolatey.log"

$temp = "D:\文档\WindowsPowerShell\temp"
$win_shell = "D:\文档\WindowsPowerShell\Scripts" 
$win_pro86 = "C:\Program Files (x86)"
$win_pro = "C:\Program Files"



#alias set
set-alias -name gh -value get-help
set-alias ll         Get-ChildItemColor
set-alias -name w -value wsl
set-alias -name hi -value history
set-alias -name fs -value findstr


#function set

function ty{
    & "C:\Program Files\Typora\Typora.exe" $args
}

$last_path
function cl
{
	$global:last_path = (pwd).path
		cd $args[0] 
		ll
}
function cu
{
	$global:last_path = (pwd).path
		if(!$args[0])
		{
			cd ..
		}
	for($i = $args[0];$i -gt 0;$i--)
	{
		cd ..
	}
}
$forward_path = (pwd).path
function cb
{
	$global:forward_path = (pwd).path
		cd $last_path
}
function cf
{
	$global:last_path = (pwd).path
		cd $forward_path
}

function refresh
{
	ipconfig /flushdns
	refreshenv
	& $profile
}
function rr
{
    $result = (ps $args[0]).Path
    tk $args[0]
    ii $result
    Write-Host restart sucessfully -NoNewline
}
function es-f
{
	e2.exe $args -w -highlight /a-d
}
function es-d
{
	e2.exe $args -w -highlight /ad
}
function es
{
	e2.exe $args -w -highlight 
}



function tk
{
	$kill_item = $args[0]+".exe"
	taskkill /f /im $kill_item
}



# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
	Import-Module "$ChocolateyProfile"
}


function Get-ChildItemColor {
	<#
		.Synopsis
		Returns childitems with colors by type.
		.Description
		This function wraps Get-ChildItem and tries to output the results
		color-coded by type:
		Directories - Cyan
		Compressed - Red
		Executables - Green
		Text Files - Gray
		Image Files - Magenta
		Others - Gray
		.ReturnValue
		All objects returned by Get-ChildItem are passed down the pipeline
		unmodified.
		.Notes
		NAME:      Get-ChildItemColor
		AUTHOR:    Tojo2000 <tojo2000@tojo2000.com>
#>
		$regex_opts = ([System.Text.RegularExpressions.RegexOptions]::IgnoreCase `
				-bor [System.Text.RegularExpressions.RegexOptions]::Compiled)
		
		$fore = $Host.UI.RawUI.ForegroundColor
		$compressed = New-Object System.Text.RegularExpressions.Regex(
				'\.(zip|tar|gz|rar|7z|tgz|bz2)', $regex_opts)
		$executable = New-Object System.Text.RegularExpressions.Regex(
				'\.(exe|bat|cmd|py|pl|ps1|psm1|vbs|rb|reg|sh)', $regex_opts)
		$text_files = New-Object System.Text.RegularExpressions.Regex(
				'\.(txt|cfg|conf|ini|csv|log|xml|md|ahk|java|c|cpp|m)', $regex_opts)
		$image_files = New-Object System.Text.RegularExpressions.Regex(
				'\.(bmp|jpg|png|gif|jpeg)', $regex_opts)
		$doc_files = New-Object System.Text.RegularExpressions.Regex(
				'\.(doc|docx|pdf|ppt)', $regex_opts)
		
		Invoke-Expression ("Get-ChildItem $args") |
		%{
			if ($_.GetType().Name -eq 'DirectoryInfo') { $Host.UI.RawUI.ForegroundColor = 'Gray' }
				elseif ($compressed.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Yellow' }
			elseif ($executable.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Green' }
				elseif ($text_files.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'DarkCyan' }
				elseif ($image_files.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Magenta' }
				elseif ($doc_files.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Cyan' }
			else { $Host.UI.RawUI.ForegroundColor = 'DarkRed' }
				echo $_
					$Host.UI.RawUI.ForegroundColor = $fore
		}
}
function Show-Color( [System.ConsoleColor] $color )
{
	$fore = $Host.UI.RawUI.ForegroundColor
		$Host.UI.RawUI.ForegroundColor = $color
		echo ($color).toString()
		$Host.UI.RawUI.ForegroundColor = $fore
}

function Show-AllColor
{
	Show-Color('Black')
		Show-Color('DarkBlue')
		Show-Color('DarkGreen')
		Show-Color('DarkCyan')
		Show-Color('DarkRed')
		Show-Color('DarkMagenta')
		Show-Color('DarkYellow')
		Show-Color('Gray')
		Show-Color('DarkGray')
		Show-Color('Blue')
		Show-Color('Green')
		Show-Color('Cyan')
		Show-Color('Red')
		Show-Color('Magenta')
		Show-Color('Yellow')
		Show-Color('White')
}
