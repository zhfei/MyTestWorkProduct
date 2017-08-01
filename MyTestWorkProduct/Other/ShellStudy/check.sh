#!/bin/sh
 
##### several cases that the scripts does not work:
##### 1) there is space or slash in the resources file, such as "aaa .png" 资源文件名中含有空格或者/
##### 2) reference resources in commented code 资源引用代码被注释了
##### 3) you need to manually checked the resources one by one in the result 对于脚本检查结果，最好人工检查一遍
##### 4) you can add some other types more than png, jpg, gif, wav, m4a 如果需要检查其他资源，请自行修改脚本；
##### 5)默认文件后缀都是如@2x.png格式，如果后缀格式不同，请自行修改脚本；
 
 
#### set parameters：PrjPath为项目工程所在目录，包含.m .xib文件；ResPath为被扫描的资源文件目录，包含.png .wav
#### xcodeprojPath为工程xcodeproj位置
PrjPath=/Users/zhoufei/Documents/LanSynergismFile/LanSynergism
ResPath=/Users/zhoufei/Documents/LanSynergismFile/LanSynergism
xcodeprojPath=/Users/zhoufei/Documents/LanSynergismFile/LanSynergism/LanSynergism.xcodeproj
 
##如果存在文件resource_san_result.txt 
if [ -f ~/Desktop/resource_san_result.txt ];then
    rm -f ~/Desktop/resource_san_result.txt
fi
 
 
##进入到工程目录下
cd $PrjPath
##搜索获取当前目录以己其子目录下以"*.m","*.xib","*.mm","*.plist"结尾文件名的文件 （find .）从当前目录以及子目录中搜索
files=$(find . -name "*.m" -o -name "*.xib" -o -name "*.mm" -o -name "*.plist")

##进入到资源目录下
cd $ResPath
##搜索获取当前目录以己其子目录下以"*.png","*.jpg","*.gif","*.wav","*.m4a"结尾文件名的文件， 并遍历文件
for png in $(find . -name "*.png" -o -name "*.jpg" -o -name "*.gif" -o -name "*.wav" -o -name "*.m4a")
do
 
    ##在图片完整路径前拼接基本名称
    basename='basename/'$png
    ##按照从前往后的方向，截去最大匹配字段，并附给变量basename
    basename=${basename##*/}
    # echo $basename
 
    ##按照从前往后的方向，截去最大匹配字段，判断余下的字符串是否等于‘png’
    if [ "${basename##*.}" == "png" ];then
        ##判断图片名称中是否包含@2x.png字符串，包含返回0
        echo $basename|grep -q @2x.png
        ##判断上一步执行是否正确
        if [ $? -eq 0 ];then
            ##将图片名称按照从后往前的方向，截去最大匹配字段，并附给变量name
            name=${basename%%@2x.png}
        else
            ##如果图片名称中不含@2x.png，则进行其他情况判断
            echo $basename|grep -q @3x.png
            if [ $? -eq 0 ];then
                ##如果图片名称中包含@3x.png，则图片名称按照从后往前的方向，截去最大匹配字段，并附给变量name
                name=${basename%%@3x.png}
            else
                ##最后，图片名称按照从后往前的方向，截去最大匹配字段，并附给变量name
                name=${basename%.png}
            fi
        fi
 
    ##同样的策略，对jpg图片的判断
    elif [ "${basename##*.}" == "jpg" ];then
        echo $basename|grep -q @2x.jpg
        if [ $? -eq 0 ];then
            name=${basename%%@2x.jpg}
        else
            echo $basename|grep -q @3x.jpg
            if [ $? -eq 0 ];then
                name=${basename%%@3x.jpg}
            else
                name=${basename%%.jpg}
            fi
        fi
    ##同样的策略，对gif图片的判断
    elif [ "${basename##*.}" == "gif" ];then
        echo $basename|grep -q @2x.gif
        if [ $? -eq 0 ];then
            name=${basename%%@2x.gif}
        else
            echo $basename|grep -q @3x.gif
            if [ $? -eq 0 ];then
                name=${basename%%@3x.gif}
            else
                name=${basename%%.gif}
            fi
        fi
    ##同样的策略，对wav图片的判断
    elif [ "${basename##*.}" == "wav" ];then
        name=${basename%%.wav}
    ##同样的策略，对m4a图片的判断
    elif [ "${basename##*.}" == "m4a" ]; then
        name=${basename%%.m4a}
    ##都不符合时，名称变成“”空字符串
    else
        name=''
    fi
 
    ##对图片名称进行过滤，如果图片名称长度大于0时
    if [ ${#name} -gt 0 ];then
        # # name=${name%%[0-9]*}
        ##进入工程目录
        cd $PrjPath
        ##判断工程文件中是否包含图片名称
        if grep -q $name $files;then
            echo "$png" is used
 
        else
            ##如果工程文件中不包含图片名，进入配置文件目录下
            cd $xcodeprojPath
            ##配置文件中包含图片名称，图片没有使用
            if grep -q $name project.pbxproj;then
                echo "$png" is not used >> ~/Desktop/resource_san_result.txt
            else
                ##配置文件中也不包含图片名称
                echo "$png" is not packaged
            fi
        fi
    ##图片名称长度为0时
    else
        echo name is empty
    fi
 
done
 
##如果存在文件resource_san_result.txt 
if [ -f ~/Desktop/resource_san_result.txt ]; then
    echo ***************the end of scan. Please see result from resource_san_result.txt
else
    echo ***************the end of scan, everything is OK
fi
