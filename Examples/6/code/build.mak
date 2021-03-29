DIR_INC := $(ROOT)/lib
DIR_SRC := $(ROOT)/code

vpath %.h $(DIR_INC)
vpath %.c $(DIR_SRC)
vpath %.cpp $(DIR_SRC)

INC +=
SRCS += main.cpp
