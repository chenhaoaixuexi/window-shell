function myps
{ 
ps|Sort-Object -Unique|Format-Table -Property ProcessName,path
}
