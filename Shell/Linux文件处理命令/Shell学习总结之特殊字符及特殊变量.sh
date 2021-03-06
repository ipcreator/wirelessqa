#! bin/bash

# -------------------------------------------------------------------------------
# 文件名:  Shell学习总结之特殊字符及特殊变量.sh
# 版 本:   1.0
# 创建日期: 2014/02/16
# 描 述:   特殊字符及特殊变量总结
# 作 者:   毕小朋
# 邮 箱:   wirelessqa.me@gmail.com
# 博 客:   http://blog.csdn.net/wirelessqa
# -------------------------------------------------------------------------------

function show_var_escape()
{
cat <<EOF

# -------------------------------------------------------
# =============  特殊字符 ==========
# -------------------------------------------------------
# ========= 用转义符\，屏蔽下一个字符的特殊意义
# ========= 特殊字符及其意义 ========= 
# &  :传递到脚本的参数数量
# *  :0个或多个在*字符前的那个普通字符
# +  :匹配1个或多个在其之前的普通字符
# ^  :匹配行首，或后面字符的非
# \$  :命令退出状态，0表示没错误，非0...
# \`  :反引号，shell引用符号，解析命令
# "  :双引用，shell引用符号
# |  :管道符号或表示“或”意义
# ?  :代表单个字符
# \\  :转义符本身

# ========= 转义符后跟字母表示的特殊意义：========= 
# \n     :换行
# \r     :回车
# \t     :Tab键
# \v或\f :换行但光标停留在原来位置
# \b     :Backspace键
# \a     :警报声
# \0xx   :ASCII码0xx对应字符

EOF


}



str_quote_explain="# ====== 引用格式:"
str_result="# >-"

function show_example_title()
{
	echo ""
	echo ${str_quote_explain} $1
}

function show_example()
{
	echo "$str_echo$1 $str_result $2"

}
show_var_escape

echo ""
echo "# -------------------------------------------------------"
echo "# =============  特殊变量引用 =========="
echo "# -------------------------------------------------------"

show_example_title "$0 : 当前脚本的文件名"

show_example "\$0" "$0"

show_example_title "\$num : num为从1开始的数字,$1是第一个参数,$2是第二个参数,${10}是第十个参数"
show_example "\$1" "$1"
show_example "\$2" "$2"
show_example "\$3" "$3"

show_example_title "\$# : 传入脚本的参数的个数"
show_example "\$#" "$#"

show_example_title "\$* : 所有的位置参数(作为单个字符串) "
show_example "\$*" "$*"

show_example_title "\$@：所有的位置参数(每个都作为独立的字符串)"
show_example "\$@" 
echo "#$@"


show_example_title "\$?：当前shell进程中，上一个命令的返回值，如果上一个命令成功执行则$?的值为0，否则为其他非零值，常用做if语句条件"
show_example "\$?" "$?"

show_example_title "\$\$：当前shell进程的pid"
show_example "\$\$" "$$"

show_example_title "\$!：后台运行的最后一个进程的pid"
show_example "\$!" "$!"

show_example_title "\$-：显示shell使用的当前选项"
show_example "\$-" "$-"

show_example_title "\$_：之前命令的最后一个参数"
show_example "\$_" "$_"
