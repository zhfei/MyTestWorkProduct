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
#echo `expr index "${your_name5}" is`

# 数组
array_name=(name1 name2 name3)
echo "这是一个数组-${array_name[@]}"
array_name[3]='name4'
echo "这是一个数组-${array_name[@]}"
echo "数组的长度：${#array_name[@]}"
echo "数组中第0个元素的长度：${#array_name[0]}"

# Shell传递参数 $n
echo 'Shell传递参数验证如下：'
echo "文件名：$0"
echo "第一个参数：$1"
echo "第二个参数：$2"
echo "脚本执行的进程ID号：$$"

# Shell运算符
# expr 是一个计算工具，完成表达式的求值操作
val1=`expr 1 + 1`
echo "expr 运算符的执行结果是$val1"

# 算术运算符
a=10
b=20
val2=`expr $a + $b`
val3=`expr $a - $b`
val4=`expr $a \* $b`
val5=`expr $a / $b`
val6=`expr $a % $b`
echo "a + b : $val2"
echo "a - b : $val3"
echo "a * b : $val4"
echo "a / b : $val5"
echo "a % b : $val6"
if [ $a == $b ]; then
	echo "a 等于 b"
fi
if [ $a != $b ]; then
	echo "a 不等于 b"
fi

# 关系运算符
if [[ $a -eq $b ]]; then
	echo "a 等于 b"
fi
if [[ $a -ne $b ]]; then
	echo "a 不等于 b"
fi
if [[ $a -gt $b ]]; then
	echo "a 大于 b"
fi
if [[ $a -lt $b ]]; then
	echo "a 小于 b"
fi
if [[ $a -ge $b ]]; then
	echo "a 大于等于 b"
fi
if [[ $a -le $b ]]; then
	echo "a 小于等于 b"
fi
































