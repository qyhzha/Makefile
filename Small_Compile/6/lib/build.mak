DIR_SRC := $(ROOT)/lib

vpath %.c $(DIR_SRC)
vpath %.cpp $(DIR_SRC)

INCS += func.h
SRCS += func.cpp
