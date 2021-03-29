.PHONY : clean rebuild all

CC := gcc
RM := del
TARGET := main.exe

$(TARGET) all : main.o func.o
	@$(CC) -o $(TARGET) main.o func.o
	@echo "compile completely"

main.o : main.c
	@$(CC) -o main.o -c main.c
	@echo "compile main.c"
	
func.o : func.c
	@$(CC) -o func.o -c func.c
	@echo "compile func.c"
	
clean :
	@$(RM) *.o $(TARGET)
	@echo "delete successfully"
	
rebuild : clean all