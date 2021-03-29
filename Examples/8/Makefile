.PHONY : all compile link clean rebuild

MODULES := Main \
           Module \
           Common

DIR_BUILD := Build
DIR_LIB := $(DIR_BUILD)/Lib
DIR_TARGET := $(DIR_BUILD)/Target
DIR_MODULES := $(addprefix $(DIR_BUILD)/,$(MODULES))

LIBS := $(addsuffix .a,$(MODULES))
LIBS := $(addprefix $(DIR_LIB)/,$(LIBS))
TARGET := $(DIR_TARGET)/target.exe

MKDIR := mkdir
RMDIR := rm -rf
CC := gcc
C++ := g++

LFLAGS := 

all : compile $(TARGET)
	@echo "compile completely."

compile : $(DIR_BUILD) $(DIR_LIB) $(DIR_MODULES)
	@set -e; \
	for dir in $(MODULES); \
	do \
		cd $$dir && $(MAKE) DIR_BUILD:=../$(DIR_BUILD) DIR_LIB:=../$(DIR_LIB) DEBUG:=$(DEBUG) && cd ..; \
	done

$(DIR_BUILD) $(DIR_LIB) $(DIR_TARGET) $(DIR_MODULES):
	@$(MKDIR) $@

link $(TARGET) : $(DIR_BUILD) $(DIR_TARGET) $(LIBS)
	@$(C++) -o $(TARGET) -Xlinker "-(" $(LIBS) -Xlinker "-)" $(LFLAGS)

clean :
	@$(RMDIR) $(DIR_BUILD)
	@echo "clean completely"

rebuild :
	@$(MAKE) clean
	@$(MAKE) all