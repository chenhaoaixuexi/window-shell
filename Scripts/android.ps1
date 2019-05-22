 $androidExe = "C:\Program Files\Android\Android Studio\bin\studio64.exe"
 $androidPath = "D:\android"
 $androidVideo = "D:\android\视频"
 $androidNox = "C:\Program Files\GOD-LIGHT\Nox\bin\Nox.exe"
function andriodOpenFile{
    $xml = (ls -r *.xml).FullName
    $java = (ls -r *.java).FullName
    echo $xml
    echo $java
    np $xml
    np $java
}
function androidCopy{
  
    $xml = (ls .\app\src\main\ -r *.xml).FullName
    $java = (ls .\app\src\main\ -r *.java).FullName
    $currentPath = (pwd).Path.Split("\")[-1]
    cd D:\android\Andriod-Study
    rm $currentPath
    mkdir $currentPath
    cp $xml $currentPath
    cp $java $currentPath
    git add .
    git commit 
    git push
}