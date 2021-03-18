学习小结：
	1. makefile支持定义变量
	2. makefile中的变量只代表文本数据
	3. makefile中的变量名规则
		--	变量名可以包含字符，数字，下划线
		--	不能包含“:”，“#”，“=”和“ ”。
		--	变量名大小写敏感
	4. 变量赋值方式：
		--	简单赋值（vary := value）		vary的值等于value		
		--	递归赋值（vary = value）		value中的变量将被解析
		--	条件赋值（vary ?= value）		如果之前没定义变量vary，定义vary并赋值value
		--  追加赋值（+=）