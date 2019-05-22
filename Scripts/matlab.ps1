#==================================|matlab |========================================'
$matlab_path = "D:\MATLAB\matlab-study"
$matlab_templet = "D:\MATLAB\matlab-study\PlatEMO v1.5 (2017-12)"
function copy_matlab{
    Merge-File -SourceDir 'D:\MATLAB\chanllenge\code' -Filter "*.m" -OutputFile 'D:\MATLAB\chanllenge\code\这是全部的代码.m'
}
function mrun
{
	matlab -noFigureWindows -singleCompThread  -automation  -nosplash -r $args 
}
function mpath 
{
	matlab -singleCompThread -nosplash -sd $args 
}

