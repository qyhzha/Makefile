.PHONY : all rebuild clean

CC := gcc
RM := del

TARGET := main.exe
SRCS := main.c func.c
OBJS := $(SRCS:c=o)

$(TARGET) all : $(OBJS)
	@$(CC) -o $(TARGET) $^
	@echo "compile completely"

$(OBJS) : %.o : %.c
	@$(CC) -o $@ -c $^
	@echo "compile $@"
	
clean :
	@$(RM) $(OBJS) $(TARGET)
	@echo "clean completely"
	
rebuild : clean all