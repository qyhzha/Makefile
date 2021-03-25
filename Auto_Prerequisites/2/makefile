.PHONY : all

MKDIR := mkdir
RMDIR := rd /s /q

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
	$(MKDIR) $@

$(TARGET) :	$(OBJS)              
	$(CC) -o $@ $^

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c
	$(CC) -o $@ -c $< $(FLAGS)
	
-include $(DEPS)

$(DIR_DEP)/%.dep : $(DIR_SRC)/%.c
	@echo "Create $@..."
	@set -e; \
	$(CC) -MM -E $< | sed 's,\(.*\)\.o[ :]*,$(DEPS)/\1.o : ,g' > $@
	
clean :
	$(RMDIR) $(DIRS)