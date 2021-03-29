.PHONY : all

DIR_CURRENT := lib

include $(DIR_CURRENT)/build.mak

CC := gcc
C++ := g++
FLAGS :=

C_FILES := $(filter %.c,$(SRCS))
CPP_FILES := $(filter %.cpp,$(SRCS))
C_OBJS := $(C_FILES:.c=.o)
C_OBJS := $(addprefix $(DIR_OBJ)/,$(C_OBJS))
CPP_OBJS := $(CPP_FILES:.cpp=.o)
CPP_OBJS := $(addprefix $(DIR_OBJ)/,$(CPP_OBJS))
C_FILES := $(addprefix $(DIR_CURRENT)/,$(C_FILES))
CPP_FILES := $(addprefix $(DIR_CURRENT)/,$(CPP_FILES))
OBJS := $(C_OBJS) $(CPP_OBJS)

all : $(OBJS)

$(C_OBJS) : $(C_FILES)
	@$(CC) -o $@ -c $< $(FLAGS)

$(CPP_OBJS) : $(CPP_FILES)
	@$(CC) -o $@ -c $< $(FLAGS)