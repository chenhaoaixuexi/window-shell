$ahk = "D:\AHK\autohotkey_study\autohotkey_ahk"

function ahk2{
    
	tk superKey
	tk autohotkey 
    D:\AHK\AutoHotkey.exe "D:\AHK\autohotkey_study\autohotkey_ahk\superKey.ahk"
}
function ahk
{
		$compile= "D:\code\AHK\Compiler\Ahk2Exe.exe"
        $icon = "D:\code\AHK\autohotkey_study\autohotkey_icon\cool.ico"

        $my_ahk_exe = "D:\Program Portable\superkey\superKey.exe"

        $my_ahk="D:\code\AHK\autohotkey_study\autohotkey_ahk\superKey.ahk"
        $ahk_path = "D:\code\AHK\autohotkey_study\autohotkey_ahk"

        tk superKey 
        tk autohotkey 

        rm $my_ahk_exe
        rm D:\code\AHK\autohotkey_study\autohotkey_ahk\*.bak
        &$compile /in $my_ahk /out  $my_ahk_exe /icon $icon /CP "65001"
        cp "D:\code\AHK\autohotkey_study\autohotkey_ahk\config.ini"  "D:\Program Portable\superkey\" 
        sleep 3
        ii $my_ahk_exe
}

function ahk_compile
{
	$ahk_compile = "D:\AHK\Compiler\Ahk2Exe.exe"
	& $ahk_compile /in $args
	$name = $args[0].split(".")[0]
	$name = $name + ".exe"	
	timeout 1
	ii $name
}
