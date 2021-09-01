.PHONY : all

vpath %.h $(DIR_INC)
vpath %.c $(DIR_SRC)

all : $(OUTPUT)

$(OUTPUT) : $(OBJS)
	@$(AR) $(ARFLAGS) $@ $^

ifeq (linux, $(OS))
$(DIR_OBJ)/%.o : %.c $(MAKEFILE_LIST)
	@$(CC) $(CFLAGS) -o $@ -c $<
else
$(DIR_OBJ)$\%.o : $(DIR_SRC)$\%.c $(MAKEFILE_LIST)
	@$(CC) $(CFLAGS) -o $@ -c $<
endif

ifeq (linux, $(OS))
$(DIR_OBJ)/%.o : %.cpp $(MAKEFILE_LIST)
	@$(C++) $(CFLAGS) -o $@ -c $<
else
$(DIR_OBJ)$\%.o : $(DIR_SRC)$\%.cpp $(MAKEFILE_LIST)
	@$(C++) $(CFLAGS) -o $@ -c $<
endif

-include $(DEPS)
