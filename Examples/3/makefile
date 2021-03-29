DIR_INC := inc
DIR_SRC := src
DIR_OBJ := obj
DIR_TARGET := target

DIRS := $(DIR_OBJ) $(DIR_TARGET)

SRCS := func.c main.c
OBJS := $(SRCS:c=o)
OBJS := $(addprefix $(DIR_OBJ)/,$(OBJS))
TARGET := main.exe
TARGET := $(DIR_TARGET)/$(TARGET)

CC := gcc
RM :=  del
MKDIR := mkdir
RMDIR := rd /s /q

FLAGS := -I $(DIR_INC)
ifdef debug
FLAGS += -g
endif

.PHONY : all rebuild clean

all : $(TARGET)

$(TARGET) : $(DIRS) $(OBJS)
	@$(CC) -o $(TARGET) $(OBJS)
	@echo "compile completely"
	
$(DIRS) :
	@$(MKDIR) $@
	
$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c
	@$(CC) -o $@ -c $^ $(FLAGS)
	@echo "compile $^"
	
clean :
	@$(RMDIR) $(DIR_OBJ)
	@$(RMDIR) $(DIR_TARGET)
	@echo "clean completely"
	
rebuild : clean all