.PHONY : all clean rebuild

DIR_INC := inc
DIR_SRC := src
DIR_TARGET := target
DIR_DEP := $(DIR_TARGET)/dep
DIR_OBJ := $(DIR_TARGET)/obj
DIR_EXE := $(DIR_TARGET)/exe

DIR := $(DIR_TARGET) $(DIR_DEP) $(DIR_OBJ) $(DIR_EXE)

INCS := $(wildcard $(DIR_INC)/*.h)
C_SRCS := $(wildcard $(DIR_SRC)/*.c)
CPP_SRCS := $(wildcard $(DIR_SRC)/*.cpp)
SRCS := $(C_SRCS) $(CPP_SRCS)
DEPS := $(C_SRCS:.c=.dep) $(CPP_SRCS:.cpp=.dep)
DEPS := $(patsubst $(DIR_SRC)/%,$(DIR_DEP)/%,$(DEPS))
OBJS := $(C_SRCS:.c=.o) $(CPP_SRCS:.cpp=.o)
OBJS := $(patsubst $(DIR_SRC)/%,$(DIR_OBJ)/%,$(OBJS))
EXE := main.exe
EXE := $(addprefix $(DIR_EXE)/,$(EXE))

MKDIR := mkdir
RMDIR := rm -rf
CC := gcc
C++ := g++

CFLAG := -I $(DIR_INC)
ifeq ($(debug),true)
CFLAG += -g
endif

LFLAG :=

all : $(DIR) $(EXE)

$(DIR) :
	@$(MKDIR) $(DIR_TARGET)
	@$(MKDIR) $(DIR_DEP)
	@$(MKDIR) $(DIR_OBJ)
	@$(MKDIR) $(DIR_EXE)

$(EXE) : $(OBJS)
	@$(C++) $(LFLAG) -o $@ $^
	@echo "compile completely."

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c
	@$(CC) $(CFLAG) -o $@ -c $<

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.cpp
	@$(C++) $(CFLAG) -o $@ -c $<

ifneq ("$(MAKECMDGOALS)","clean")
-include $(DEPS)
endif

ifeq ("$(wildcard $(DIR))","")
$(DIR_DEP)/%.dep : $(DIR_SRC)/%.c $(DIR)
else
$(DIR_DEP)/%.dep : $(DIR_SRC)/%.c
endif
	@set -e; \
	$(C++) $(CFLAG) -MM -E $< | sed 's,\(.*\)\.o[ :]*,$(DIR_OBJ)/\1.o $@ : ,g' > $@

ifeq ("$(wildcard $(DIR))","")
$(DIR_DEP)/%.dep : $(DIR_SRC)/%.cpp $(DIR)
else
$(DIR_DEP)/%.dep : $(DIR_SRC)/%.cpp
endif
	@set -e; \
	$(C++) $(CFLAG) -MM -E $< | sed 's,\(.*\)\.o[ :]*,$(DIR_OBJ)/\1.o $@ : ,g' > $@

clean :
	@$(RMDIR) $(DIR)
	@echo "clean completely."

rebuild :
	@$(MAKE) clean
	@$(MAKE) all