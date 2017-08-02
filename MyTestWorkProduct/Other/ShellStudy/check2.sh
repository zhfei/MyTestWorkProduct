#!/bin/sh

PrjPath=/Users/xuyefeng/Documents/MyCode/MyGitHub
ResPath=/Users/xuyefeng/Documents/MyCode/MyGitHub/MyTestWorkProduct/Assets.xcassets
xcodeprojPath=/Users/xuyefeng/Documents/MyCode/MyGitHub/MyTestWorkProduct.xcodeproj

if [[ -f ~/Desktop/shell/resource_san_result.txt ]]; then
    rm -rf ~/Desktop/shell/resource_san_result.txt
else
    echo "不存在文件"
fi

cd ${PrjPath}
files=$(find . -name "*.m" -o -name "*.xib" -o -name "*.mm" -o -name "*.plist")
#echo ${files}
cd ${ResPath}
for png in $(find . -name "*.png" -o -name "*.jpg" -o -name "*.gif" -o -name "*.wav" -o -name "*.m4a"); 
do
    #echo ${png}
    basename='basename/'${png}
    basename=${basename##*/}
    name=""
    #echo ${basename}
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

        if grep -q ${name} ${files} ; then
            echo "${png}" "被使用"
        else
            cd ${xcodeprojPath}
            if grep -q ${name} project.pbxproj; then
                echo "$png" 没有被使用 >> ~/Desktop/shell/resource_san_result.txt
            else
                echo "$png" 不包含此图片
            fi

        fi
    else
        echo "图片名称长度为0"
    fi
done

if [[ -f ~/Desktop/shell/resource_san_result.txt ]]; then
    echo "扫描结束，请前往结果文件中查看结果"
else
    echo "扫描结束，everthing is ok !!"
fi






