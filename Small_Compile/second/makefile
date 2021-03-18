.PHONY : all rebuild clean

CC := gcc
RM := del

TARGET := main.exe

$(TARGET) all : main.o func.o
	@$(CC) -o $@ $^
	@echo "compile completely"

main.o : main.c
	@$(CC) -o $@ -c $^
	@echo "compile $^"
	
func.o : func.c
	@$(CC) -o $@ -c $^
	@echo "compile $^"
	
clean :
	@$(RM) *.o $(TARGET)
	@echo "clean completely"
	
rebuild : clean all