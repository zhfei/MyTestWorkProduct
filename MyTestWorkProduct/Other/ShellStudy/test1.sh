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
echo "----------数组---------"
array_name=(name1 name2 name3)
echo "这是一个数组-${array_name[@]}"
array_name[3]='name4'
echo "这是一个数组-${array_name[@]}"
echo "数组的长度：${#array_name[@]}"
echo "数组中第0个元素的长度：${#array_name[0]}"

# Shell传递参数 $n
echo "----------Shell传递参数---------"
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
echo "----------算术运算符---------"
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
echo "----------关系运算符---------"
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

# 布尔运算符 ！、-o、-a
echo "----------布尔运算符---------"
if [[ $a != $b ]]; then
	echo "a 不等于 b"
fi
if [ $a -lt $b -o $a -eq $b ]; then
	echo "a 大于等于 b"
fi
if [ $a -gt 1 -a $b -lt 10 ]; then
	echo "a > 1 并且 b < 10"
else
	echo "a > 1 并且 b < 10 是错误的！"
fi

# 逻辑运算符 && ||
echo "----------逻辑运算符---------"
if [[ $a -gt 1 && $a -lt 100 ]]; then
	echo "a 大于1 并且 a 小于100 成立"
else
	echo "a 大于1 并且 a 小于100 不成立"
fi
if [[ $a -le 10 || $a -gt 100 ]]; then
	echo 'a 小于等于10 或者 a 大于 100 有一个成立'
else
	echo 'a 小于等于10 或者 a 大于 100 都不成立'
fi

# 字符串运算符
echo "----------字符串运算符---------"
string1='string1'
string2='string2'
if [[ $string2 = $string1 ]]; then
	echo "string1 等于 string2"
else
	echo "string1 不等于 string2"
fi
if [[ $string2 != $string1 ]]; then
	echo "string2 不等于 string1"
fi
if [[ -z $string1 ]]; then
	echo "string1 长度是：0"
fi
if [[ -n $string1 ]]; then
	echo "string1 长度不是：0"
fi
if [[ $string1 ]]; then
	echo "string1 不为nil"
fi

# 文件测试运算符
echo "----------文件测试运算符---------"
file1='假如为：文件'
file2='假如为：文件夹'
if [[ -d $file2 ]]; then
	echo '检测文件为文件夹'
fi
if [[ -f $file1 ]]; then
	echo '检测文件为普通文件'
fi
if [[ -s $file1 ]]; then
	echo '检测文件为空'
fi
if [[ -e $file1 ]]; then
	echo '检测文件为存在的'
fi

# echo命令
echo "----------echo命令---------"
echo "It is a test"
echo "\"It is a test\""
echo "下面换行 \n"
echo -e "下面不换行 \c"  # -e 开启转义 \c 不换行
echo "字符串重定向到文件中" > myfile
echo '字符串原样输出 $a'
echo `date` #显示执行结果

# printf命令
# printf  format-string  [arguments...]
# %s %c %d %f都是格式替代符
# %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，如果不足则自动以空格填充，超过也会将内容全部显示出来。
# %-4.2f 指格式化为小数，其中.2指保留2位小数。
# \n换行  \r回车
echo "----------printf命令---------"
echo 'Hello, Shell,能够自动换行'
printf "Hello, Shell,不能自动换行，需要手动加换行符 \n"
printf "%-10s %-8s %-4s\n" 姓名 性别 体重
printf "%-10s %-8s %-4.2f\n" 郭靖 男 66.12345
printf "%-10s %-8s %-4.2f\n" 杨过 男 77.12345

# test命令
# Shell中的 test 命令用于检查某个条件是否成立，它可以进行数值、字符和文件三个方面的测试。
echo "----------test命令---------"
test1=100
test2=101
testString1='testString1'
testString2='testString2'
if test $test1 -lt $test2 ; then
	printf "%s\n" test1小于test2 
fi
if test -z testString1 ; then
	printf "testString1长度为0"
else
	printf "testString1长度不为0 ，:%s\n" testString1
fi
if test -e ./test1.sh ; then
	printf "文件名：test1.sh 存在\n"
else
	printf "文件名：test1.sh 不存在\n"
fi

# Shell流程控制
echo "----------Shell流程控制---------"
# if else-if else
if [[ $a == $b ]]; then
	echo "a 等于 b"
elif [[ $a -gt $b ]]; then
	echo "a 大于 b"
elif [[ $a -lt $b ]]; then
	echo "a 小于 b"
else
	echo "没有符合条件的"
fi
num1=$[2*3]
num2=$[1+5]
if  test $num1 -eq $num2 ; then
	echo "num2 等于 num1"
else
	echo "num1 不等于 num2"
fi
# for 循环
for loop in  1 2 3 4 5 6; do
	# echo "当前输入的值是：$loop"
	printf "当前输入的值是：%s\n" $loop 
done
for string in 'This is a String!'; do
	echo "$string"
done
# while 语句
# let 命令，它用于执行一个或多个表达式
ignore0(){
	count=1;
	while [[ $count -lt 10 ]]; do
		echo "while 执行结果：$count"
		let "count++"
	done
	echo '按下 <CTRL-D> 退出'
	echo -n '输入你最喜欢的电影名: '
	while read Film ; do
		echo "是的！ $Film 是一部好电影！"
	done
}
#ignore0
ignore1(){
	while true:
	do
	    echo "无限循环!"
	done
	until false ; do
		echo "无限循环!"
	done
}
#ignore1
# case语句
ignore2(){
	echo '请输入1到4之间的数字'
	echo '你输入的数字是：'
	read aNum
	case $aNum in
		1 )
	 echo "输入的数字为：$aNum"
		;;
		2 )
	 echo "输入的数字为：$aNum"
		;;
		3 )
	 echo "输入的数字为：$aNum"
		;;
		4 )
	 echo "输入的数字为：$aNum"
		;;
		* )
	 echo "你输入的数字不在1-4之间"
		;;
	esac
}
#ignore2
# break命令
ignore3(){   
    while true
	do
		echo '输入1-5之间的数据'
		read aNum
		case $aNum in
			1|2|3|4|5 )
	         echo "输入的数字为：$aNum"
				;;
			* )
	         echo "你输入的数字不在1-4之间"
	         break
	         #continue
	         echo "游戏结束"
	        
		esac
	done
}
#ignore3
# Shell 函数
echo "----------Shell 函数---------"
demoFunc(){
	echo '这是第一个函数'
}
echo '第一个函数开始'
demoFunc
echo '第一个函数结束'
funWithReture(){
	echo '这个函数会对输入的参数进行加法运行...'
	echo '输入第一个参数：'
	read para1
	echo '输入第二个参数：'
	read para2
	echo "两次输入的参数分别是：$para1---$para2"
    return $(($para1+$para2))
}
funWithReture 
echo "输入的数字之和为：$?"

# Shell 输入/输出重定向
echo "----------Shell 输入/输出重定向---------"
date >> myfile
cat myfile
wc -l << EOF
标题
测试 Head Document 类型
的追加重定向命令
EOF
ls > myfile 2>&1
ls > /dev/null 2>&1

# Shell 文件包含
echo "----------Shell 文件包含---------"
source ./test2.sh
echo "引用外部的test2.sh文件中的url变量，URL变量为：$url"
























