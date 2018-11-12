#==================================|matlab |========================================'
$matlab_path = "D:\MATLAB\matlab-study"
$matlab_templet = "D:\MATLAB\matlab-study\PlatEMO v1.5 (2017-12)"
function mrun
{
	matlab -noFigureWindows -singleCompThread  -automation  -nosplash -r $args 
}
function mpath 
{
	matlab -singleCompThread -nosplash -sd $args 
}

