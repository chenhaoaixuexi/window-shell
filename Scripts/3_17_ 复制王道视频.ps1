cd D:\考研\视频_王道\36895433
mkdir D:\考研\视频_王道\视频_数据结构
foreach($fileName in (ls).Name){
cp ./$fileName/*/*.blv D:\考研\视频_王道\视频_数据结构\$fileName.blv
}
