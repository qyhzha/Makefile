学习小结：
	变量的后缀替换：
		表达式：$(var:x=y)
		作用：将变量var中的字符串后缀字符x替换成y，后缀字符不是x则不替换
		例子：
			x := a.c b.c c.c
			y := $(x:c=o)	#y 等价于 a.o b.o c.o
	变量的模式替换：
		表达式：$(var:a%b=x%y)
		作用：将变量var中的字符串匹配a%b的部分替换成x%y，不匹配则不替换
		例子：
			x := a1b.c a2b.c a3b.c
			y := $(x:a%b.c=x%y)	#y 等价于 x1y.c x2y.c x3y.c
	规则中的模式匹配：
		表达式：target : target-pattern : prereq-pattern
		作用：通过target-pattern从target中寻找子目标，再通过prereq-pattern从子目标生成依赖，进而构成完整的规则。
		例子：
			OBJS := a.o b.o
			OBJS : %.o : %.c
				gcc -o $@ -c $^	
		等效于：
			a.o : a.c
				gcc -o a.o -c a.c
			b.o : b.c
				gcc -o b.o -c b.c
	make可以在命令行定义变量，如果命令行变量和makefile内部定义的变量冲突，命令行变量将覆盖makefile内部定义的变量。
	override关键字：
		作用是命令行变量和makefile内部变量冲突时，指示使用makefile内部变量。
		override变量的定义和赋值都需要使用override关键字。
	define关键字：
		用于在makefile中定义多行变量。
		多行变量的定义从变量名开始到endef结束。
		override关键字和define关键字可同时作用到同一变量上。
	环境变量：
		makefile中能够直接使用环境变量。
		假设定义了同名变量，环境变量将被覆盖。
		运行make时指定"-e"选项，make将优先使用环境变量。
		环境变量的优点：环境变量可以在所有的makefile中使用。
		环境变量的缺点：过多的依赖环境变量将影响到makefile的可移植性。
		windows操作系统环境变量名需要大写
	变量在不同makefile之间的传递方式：
		直接在外部定义环境变量进行传递（不推荐，因为会降低makefile的移植性）。
		使用export定义变量进行传递（等效于定义临时环境变量）。
		定义make命令行变量进行传递。
	目标变量：
		目标变量的作用域只在指令目标及连带规则中。
		定义方式：target : varyName : varyValue。
	模式变量：
		模式变量是对目标变量的一种扩展。
		模式变量的作用域在符合模式的目标及连带规则中。
		定义方式：pattern : varyName := varyValue。
		例如：%e : var := yonghang.qin