.PHONY : all build_lib build_main clean rebuild

ROOT := $(realpath ./)

DIR_TARGET := target
DIR_OBJ := $(DIR_TARGET)/obj
DIR_EXE := $(DIR_TARGET)/exe
DIR_LIB := lib
DIR_CODE := code

DIRS := $(DIR_TARGET) $(DIR_OBJ) $(DIR_EXE)

MAK := $(DIR_LIB)/build.mak $(DIR_CODE)/build.mak

include $(MAK)

C_FILES := $(filter %.c,$(SRCS))
CPP_FILES := $(filter %.cpp,$(SRCS))
C_OBJS := $(C_FILES:.c=.o)
C_OBJS := $(addprefix $(DIR_OBJ)/,$(C_OBJS))
CPP_OBJS := $(CPP_FILES:.cpp=.o)
CPP_OBJS := $(addprefix $(DIR_OBJ)/,$(CPP_OBJS))
OBJS := $(C_OBJS) $(CPP_OBJS)
EXES := main.exe
EXES := $(DIR_EXE)/$(EXES)

CC := gcc
C++ := g++
MKDIR := mkdir
RMDIR := rm -rf

all : $(DIRS) $(EXES)

$(DIRS) :
	@$(MKDIR) $(DIR_TARGET)
	@$(MKDIR) $(DIR_OBJ)
	@$(MKDIR) $(DIR_EXE)

$(EXES) : $(OBJS)
	@$(C++) -o $@ $^
	@echo "compile completely."

$(OBJS) : build_lib build_code

build_lib :
	@$(MAKE) -f $(DIR_LIB)/makefile DEBUG:=$(DEBUG) DIR_OBJ:=$(DIR_OBJ) ROOT:=$(ROOT)

build_code :
	@$(MAKE) -f $(DIR_CODE)/makefile DEBUG:=$(DEBUG) DIR_OBJ:=$(DIR_OBJ) ROOT:=$(ROOT)

clean :
	@$(RMDIR) $(DIR_TARGET)
	@echo "clean completly"

rebuild :
	@$(MAKE) clean
	@$(MAKE) all
