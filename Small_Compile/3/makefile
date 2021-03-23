.PHONY : all rebuild clean

CC := gcc
RM := del

INCFOLDER := inc
SRCFOLDER := src
OBJFOLDER := obj
TARGETFOLDER := target
SRCS := main.c func.c
OBJS := $(SRCS:c=o)
TARGET := main.exe

$(TARGETFOLDER)/$(TARGET) all : $(OBJFOLDER)/$(OBJS)
	@$(CC) -o $@ $^
	@echo "compile completely"

$(OBJFOLDER)/$(OBJS) : $(OBJFOLDER)/%.o : $(SRCFOLDER)/%.c
	@$(CC) -o $@ -c $^
	
clean :
	@$(RM) $(OBJFOLDER)/*.o $(TARGETFOLDER)/$(TARGET)
	@echo "clean completely"
	
rebuild : clean all