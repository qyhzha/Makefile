.PHONY : all

var1 := A
var2 := $(var1)
var3 :=
var1 := B

all :
	@echo "var1 = $(var1)"
	@echo "var2 = $(var2)"
ifeq ($(var1),$(var2))
	@echo "var1 = var2"
else
	@echo "var1 != var2"
endif
ifdef var1
	@echo "define var3"
else
	@echo "not define var3"
endif