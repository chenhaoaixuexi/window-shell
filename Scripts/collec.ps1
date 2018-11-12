#!powershell
# IMG_20180802 hangzhou_ontrain
# IMG_20180803 hangzhou_xihu
# IMG_20180804 hangzhou_xitang
# 
# IMG_20180922 beijing_houhai
# IMG_20180923 beijing_gugong
# 
# IMG_20181003 shenyang_zhongshanlu
# IMG_20181004 shenyang_shuaifu
# IMG_20181005 shenyang_chi

$path = "D:\mindMap_思维导图\mind_生活\旅游\照片"

foreach($full_name in (ls $path))
{
	$name_array = $full_name.Split("_")
		$name_compare = $name_array[0]+$name_array[1]
		if(!$name_compare.compareTo("IMG_20180802"))
		{
			$new_name = "鏉窞-鐏溅"+$name_array[-1];
			mv $full_name $new_name
		}
}
