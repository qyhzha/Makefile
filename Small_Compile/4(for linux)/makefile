.PHONY : all rebuild

MKDIR := mkdir
RMDIR := rm -rf

DIR_INC := inc
DIR_SRC := src
DIR_DEP := dep
DIR_OBJ := obj
DIR_TARGET := target

DIRS := $(DIR_DEP) $(DIR_OBJ) $(DIR_TARGET)

INCS := func.h
SRCS := main.c func.c
DEPS := $(SRCS:.c=.dep)
OBJS := $(SRCS:.c=.o)
INCS := $(addprefix $(DIR_INC)/,$(INCS))
SRCS := $(addprefix $(DIR_SRC)/,$(SRCS))
DEPS := $(addprefix $(DIR_DEP)/,$(DEPS))
OBJS := $(addprefix $(DIR_OBJ)/,$(OBJS))
TARGET := main.exe
TARGET := $(addprefix $(DIR_TARGET)/,$(TARGET))

CC := gcc
RM := del
FLAGS := -I $(DIR_INC)

all : $(DIRS) $(TARGET)

$(DIRS) :
	@echo "Create $@"
	@$(MKDIR) $@

$(TARGET) :	$(OBJS)              
	$(CC) -o $@ $^
	@echo "Compile completely"

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c
	$(CC) -o $@ -c $< $(FLAGS)   

ifneq ("$(MAKECMDGOALS)","clean")
-include $(DEPS)
endif

ifeq ("$(wildcard $(DIR_DEPS))", "")
$(DIR_DEP)/%.dep : $(DIR_SRC)/%.c $(DIRS)
else
$(DIR_DEP)/%.dep : $(DIR_SRC)/%.c
endif
	@echo "Create $@..."
	@set -e; \
	$(CC) -MM -E $< $(FLAGS) | sed 's,\(.*\)\.o[ :]*,$(DIR_OBJ)/\1.o $@ : ,g' > $@
	
clean :
	$(RMDIR) $(DIRS)

rebuild :
	@$(MAKE) clean
	@$(MAKE) all