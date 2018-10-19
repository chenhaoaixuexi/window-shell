# variable set
$vim= 'C:\Program Files (x86)\Vim\_vimrc'
$wsl = "C:\Users\26306\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\ch"
$temp = "D:\WindowsPowerShell\temp"
$wsl_experiment = "C:\Users\26306\AppData\Local\Packages\CanonicalGroupLimited.UbuntuonWindows_79rhkp1fndgsc\LocalState\rootfs\home\ch\linux-experiment"
$matlab = "D:\MATLAB\matlab-study"
$host_path = "C:\Windows\System32\drivers\etc\hosts"
$win_shell = "D:\WindowsPowerShell" 


#alias set
set-alias -name gh -value get-help
set-alias -name w -value wsl
set-alias -name hi -value history
set-alias ll         Get-ChildItemColor
set-alias fs -value findstr

#function set
$ahk_path = "C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk"
function ahk
{
	tk esc_vim.exe
	rm 'C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_exe\esc_vim.exe'
	rm 'C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\*.bak'
	mv $ahk_path\esc_vim.exe 'C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_exe'	
	ii 'C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_exe\esc_vim.exe'
}
function refresh
{
	ipconfig /flushdns
	$temp = $env:path
	$env:path = C:
	$env:path = $temp
	& $profile
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

function gitpush 
{
	git add .
	git  commit -m "just a commit"
	git push
}
function m
{
	matlab -noFigureWindows -singleCompThread  -automation  -nosplash -r $args 
}
function tk
{
	taskkill /f /im $args	
}
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
      '\.(txt|cfg|conf|ini|csv|log)', $regex_opts)
  $image_files = New-Object System.Text.RegularExpressions.Regex(
      '\.(bmp|jpg|png|gif|jpeg)', $regex_opts)
 
  Invoke-Expression ("Get-ChildItem -Force $args") |
    %{
      if ($_.GetType().Name -eq 'DirectoryInfo') { $Host.UI.RawUI.ForegroundColor = 'Cyan' }
      elseif ($compressed.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Red' }
      elseif ($executable.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Green' }
      elseif ($text_files.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Gray' }
      elseif ($image_files.IsMatch($_.Name)) { $Host.UI.RawUI.ForegroundColor = 'Magenta' }
      else { $Host.UI.RawUI.ForegroundColor = 'Gray' }
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


# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
