$ahk = "C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk"


function ahk
{
		$compile= "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
		$icon = "C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_icon\cool.ico"

		$universal_exe = "C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_exe\superKey_universal.exe"
		$my_ahk_exe = "C:\Program Files\AutoHotkey\Script\my_ahk_exe\superkey.exe"

		$universal_ahk = "C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\superKey_universal.ahk"
		$my_ahk="C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\superKey.ahk"
		$ahk_path = "C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk"
		$ahk_bck = "C:\Program Files\AutoHotkey\Script\supper-keyboard\autohotkey_ahk"

		tk superKey
		tk autohotkey 

		rm $universal_exe
		rm $my_ahk_exe
		&$compile /in $universal_ahk /out  $universal_exe /icon $icon
		&$compile /in $my_ahk /out  $my_ahk_exe /icon $icon
		rm 'C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\*.bak'
		rm 'C:\Program Files\AutoHotkey\Script\autohotkey_study\autohotkey_ahk\*.swp'
		timeout 1
		ii $my_ahk_exe
		cp $ahk_path\* $ahk_bck\
}

function ahk_compile
{
	$ahk_compile = "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
	& $ahk_compile /in $args
	$name = $args[0].split(".")[0]
	$name = $name + ".exe"	
	timeout 1
	ii $name
}
