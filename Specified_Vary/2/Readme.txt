学习小结：
	make中有一些特殊变量，例如 “$(MAKE)”，“$(MAKECMDGOALS)”，“$(MAKEFILE_LIST)”。
	$(MAKE) ：当前make解释器的文件名
	$(MAKECMDGOALS) ：命令行中指定的目标名，不包含指定的make文件名
	$(MAKEFILE_LIST) ：make所需要处理的makefile文件列表，当前makefile的文件名总是位于最后，文件名之间以空格隔开