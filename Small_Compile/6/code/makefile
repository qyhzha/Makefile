.PHONY : all

DIR_CURRENT := code

include $(DIR_CURRENT)/build.mak

CC := gcc
C++ := g++
CFLAGS := -I $(DIR_INC)

C_FILES := $(filter %.c,$(SRCS))
CPP_FILES := $(filter %.cpp,$(SRCS))
C_OBJS := $(C_FILES:.c=.o)
C_OBJS := $(addprefix $(DIR_OBJ)/,$(C_OBJS))
CPP_OBJS := $(CPP_FILES:.cpp=.o)
CPP_OBJS := $(addprefix $(DIR_OBJ)/,$(CPP_OBJS))
#C_FILES := $(addprefix $(DIR_SRC)/,$(SRCS))
#CPP_FILES := $(addprefix $(DIR_SRC)/,$(SRCS))
OBJS := $(C_OBJS) $(CPP_OBJS)

all : $(OBJS)

$(C_OBJS) : $(C_FILES)
	$(CC) $(CFLAGS) -o $@ -c $<

$(CPP_OBJS) : $(CPP_FILES)
	$(C++) $(CFLAGS) -o $@ -c $<
