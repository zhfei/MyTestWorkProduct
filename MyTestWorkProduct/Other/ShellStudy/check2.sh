#!/bin/sh

PrjPath=/Users/zhoufei/Documents/MyFile/MyTestWorkProduct
ResPath=/Users/zhoufei/Documents/MyFile/MyTestWorkProduct/MyTestWorkProduct/Assets.xcassets
xcodeprojPath=/Users/zhoufei/Documents/MyFile/MyTestWorkProduct/MyTestWorkProduct.xcodeproj

#PrjPath=/Users/xuyefeng/Documents/MyCode/MyGitHub
#ResPath=/Users/xuyefeng/Documents/MyCode/MyGitHub/MyTestWorkProduct/Assets.xcassets
#xcodeprojPath=/Users/xuyefeng/Documents/MyCode/MyGitHub/MyTestWorkProduct.xcodeproj

if [[ -f ~/Desktop/shell/resource_san_result.txt ]]; then
    rm -rf ~/Desktop/shell/resource_san_result.txt
else
    echo "不存在文件"
    if [[ ! -d ~/Desktop/shell ]]; then
        mkdir ~/Desktop/shell
    fi
fi

totalCount=0
usedCount=0
notUsedCount=0
time=`date`
echo "开始时间：${time}" >> ~/Desktop/shell/resource_san_result.txt

cd ${PrjPath}
#echo "---------------------------------工程目录"`pwd`
files=$(find . -path './Pods' -name "*.m" -o -name "*.xib" -o -name "*.mm")
#echo ${files}
cd ${ResPath}
#echo "---------------------------------图片资源目录"`pwd`
for png in $(find . -name "*.png" -o -name "*.jpg" -o -name "*.gif" -o -name "*.wav" -o -name "*.m4a"); 
do
    #echo ${png}
    basename='basename/'${png}
    basename=${basename##*/}
    name=""
    #echo ${basename}
    totalCount=$[totalCount+1]
    if [[ "${basename##*.}" == "png" ]]; then
        #echo ${basename}
        echo ${basename}|grep -q @2x.png
        if [[ $? -eq 0 ]]; then
            name=${basename%%@2x.png}
        else
            echo ${basename}|grep -q @3x.png
            if [[ $? -eq 0 ]]; then
                name=${basename%%@3x.png}
            else
                name=${basename%%.png}
            fi

        fi
    elif [[ "${basename##*.}" == "jpg" ]]; then
        #echo ${basename}
        echo ${basename}|grep -q @2x.jpg
        if [[ $? -eq 0 ]]; then
            name=${basename%%@2x.jpg}
        else
            echo ${basename}|grep -q @3x.jpg
            if [[ $? -eq 0 ]]; then
                name=${basename%%@3x.jpg}
            else
                name=${basename%%.jpg}
            fi

        fi
    elif [[ "${basename##*.}" == "gif" ]]; then
        #echo ${basename}
        echo ${basename}|grep -q @2x.gif
        if [[ $? -eq 0 ]]; then
            name=${basename%%@2x.gif}
        else
            echo ${basename}|grep -q @3x.gif
            if [[ $? -eq 0 ]]; then
                name=${basename%%@3x.gif}
            else
                name=${basename%%.gif}
            fi

        fi
    elif [[ "${basename##*.}" == "wav" ]]; then
        name=${basename%%.wav}
    elif [[ "${basename##*.}" == "m4a" ]]; then
        name=${basename%%.m4a}
    else
        name=""
    fi

    
    if [[ ${#name} -gt 0 ]]; then
        cd ${PrjPath}
        #echo "---------------------------------重新回到工程目录"`pwd`
        if grep -q ${name} ${files} ; then
            echo "${png}" "被使用"
            usedCount=$[usedCount+1]
        else
            cd ${xcodeprojPath}
            if grep -q ${name} project.pbxproj; then
                echo "$png 图片被工程索引但是未使用" >> ~/Desktop/shell/resource_san_result.txt
            else
                echo "$png 图片没有被工程索引到而且也未使用" >> ~/Desktop/shell/resource_san_result.txt
            fi
            notUsedCount=$[notUsedCount+1]
        fi
    else
        echo "无效的图片名称：${png}" >> ~/Desktop/shell/resource_san_result.txt
        notUsedCount=$[notUsedCount+1]
    fi
done

time=`date`
echo "结束时间：${time}" >> ~/Desktop/shell/resource_san_result.txt

echo "总共图片数：${totalCount}.   使用的图片数：${usedCount}.   为使用的图片数：${notUsedCount}"

if [[ -f ~/Desktop/shell/resource_san_result.txt ]]; then
    echo "扫描结束，请前往结果文件中查看结果  文件路径：~/Desktop/shell/resource_san_result.txt"
else
    echo "扫描结束，everthing is ok !!"
fi






