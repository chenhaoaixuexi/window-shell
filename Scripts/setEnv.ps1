. "D:\文档\WindowsPowerShell\Scripts\fileControl.ps1"
function setEnv{
   # [System.Environment]::SetEnvironmentVariable("TEMP","%SystemRoot%\TEMP",[System.EnvironmentVariableTarget]::Machine)
   vi temp.txt
   $value = readFile temp.txt
   [System.Environment]::SetEnvironmentVariable($args[0],$value,[System.EnvironmentVariableTarget]::Machine)
   echo $value
   # rm temp.txt
}