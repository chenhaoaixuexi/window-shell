function ky{
    ii D:\六维下载\李永乐2019线性代数强化
    sleep 1
    ii D:\考研\视频_张宇高数
    sleep 1
    ii D:\考研\视频_张宇\概率统计9讲
    sleep 1
    ii D:\考研\视频_王道\视频_操作系统
    sleep 1
    ii D:\考研\视频_王道\视频_计网
    sleep 1
    ii D:\考研\视频_王道\视频_计组
}
function taskAndroid{
    $androidDoc = "http://www.android-doc.com/reference/packages.html"
    ii $androidPath
    sleep 1
    ii "D:\android\source"
    ii "D:\android\安卓每日渐进.emmx"
    ii $androidVideo
    ii $androidNox
    ii $androidExe
    ii "D:\android\android 英语词库.md"
    Start-Process -FilePath $androidDoc
}

function taskGossip{
    ii "D:\threeUp_大三上\课程_分布式系统\code"
    ii "D:\helpdoc_帮助文档\java.CHM"
    ii "C:\Program Files\JetBrains\IntelliJ IDEA 2018.3\bin\idea64.exe"
    & "C:\Program Files\Typora\Typora.exe" "D:\threeUp_大三上\课程_分布式系统\code\markdown"
}

function taskWebService{
    Start-Process -FilePath "https://ke.qq.com/webcourse/index.html#cid=28875&term_id=100182700&taid=800289846227147&type=512&vid=s14006iqo9h"
    ii "D:\threeUp_大三上\课程_分布式组件与Web服务\作业\code"
    ii "C:\Program Files\JetBrains\IntelliJ IDEA 2018.3\bin\idea64.exe"
}
function taskPython{
    $url = "https://study.163.com/course/courseLearn.htm?courseId=1003285002#/learn/video?lessonId=1003742007&courseId=1003285002"
    $pythonExe = "C:\Program Files\JetBrains\PyCharm Community Edition 2018.2.3\bin\pycharm64.exe"
    jupyter-notebook.exe --no-browser
    Start-Process -FilePath $url
    ii $pythonExe
    
}

function taskAHK{
    $ahk_help = "C:\Program Files\AutoHotkey\auto_help\ahk.chm"
    $ahk_path = "D:\AHK\Script\autohotkey_study\autohotkey_ahk"
    ii $ahk
    ii $ahk_help
    ii $ahk_path\*.ahk
    tk superkey
    & "C:\Program Files\AutoHotkey\AutoHotkeyU64.exe" $ahk_path\superKey.ahk
}

function taskMatlab{
    $path = "D:\MATLAB\chanllenge挑战杯\code"
    $path2 = "D:\MATLAB\chanllenge挑战杯"
    ii $path
    sleep 1
    ii $path2
    np $path\*
    Start-Process -FilePath "https://ww2.mathworks.cn/help/matlab/referencelist.html?type=function&category=index"
 	matlab -singleCompThread -nosplash -sd $path    
}
function psiTask{
    psi $win_shell\task.ps1
}

function tkSave{
$softName = 'Thunder','ConEmu64','ConEmuC64','TickTick','WGestures'
,'TrafficMonitor','NVDisplay.Container','MicrosoftEdge','mailmaster','HuaweiHiSuiteService64','GoodSync',
'DolbyDAX2API','DownloadSDKServer','cmd','PowerWord','powershell'
'chrome';
foreach ($i in $softName){
    $kill_item = $i + ".exe";
	taskkill /f /im $kill_item
}
}