.PHONY : clean

main.exe all : main.o func.o
	@gcc -o main.exe main.o func.o
	@echo "compile completely"

main.o : main.c
	@gcc -o main.o -c main.c
	@echo "compile main.c"
	
func.o : func.c
	@gcc -o func.o -c func.c
	@echo "compile func.c"
	
clean :
	@del *.o main.exe
	@echo "delete successfully"