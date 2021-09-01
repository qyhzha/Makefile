
OS := linux

MKDIR := mkdir
ifeq (linux, $(OS))
RMDIR := rm -rf
else
RMDIR := rd /s/q
endif
CC := gcc
C++ := g++
CP := cp

DIR_INC := $(addprefix -I,$(DIR_INC))

CFLAGS += -MMD $(DIR_INC)
ifeq ($(DEBUG), true)
CFLAGS += -g
endif

AR := ar
ARFLAGS := crs

LFLAGS +=