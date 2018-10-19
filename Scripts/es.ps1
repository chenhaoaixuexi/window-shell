$return
function es
{
	$return =es2.exe -w -highlight  $args
	$count=0
	foreach($temp in $return){
		$temp_2 ="$count "+$temp
        echo $temp_2
		$count=$count+1
	}
}
