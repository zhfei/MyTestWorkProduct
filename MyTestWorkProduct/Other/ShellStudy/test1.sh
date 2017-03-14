#!/bin/bash

# 第一个脚本
# chmod +x ./test.sh   使脚本具有执行权限
# ./test.sh            在当前目录下执行脚本
# /bin/sh test.sh      指定解释器，执行脚本

#echo "hello World!"


#----------------------------------------------#
# 第二个脚本
# 声明变量、给变量赋值、声明变量为只读类型
your_name="zhoufei"
echo $your_name
echo ${your_name}

your_name="google"
echo ${your_name}

#readonly your_name
your_name="声明为只读变量"

# 字符串
# ''输出纯字符串,有变量也失效
# ""里面可以包含变量
your_name2='baidu'
str="hello I know your are \"${your_name2}\" ! \n"
echo ${str}

# 字符串拼接
your_name3="baidu3"
greeting="I like "${your_name3}"! ---"
greeting2="I like "$your_name3" ! \n"
echo ${greeting} ${greeting2}

# 字符串长度
echo "${your_name3} 长度是：${#your_name3}"

# 子字符串
your_name4='获取这个字符串的后三位'
echo ${your_name4:8:3}

# 查找子字符串
your_name5="runoob is a great company"
echo `expr index "${your_name5}" is`








