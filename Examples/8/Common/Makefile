.PHONY : all

DIR_CURRENT := $(realpath .)
MODULE := $(notdir $(DIR_CURRENT))
DIR_COMMON_INC := ../Common/inc
DIR_INC := inc
DIR_SRC := src
DIR_OBJ := $(DIR_BUILD)/$(MODULE)

vpath %.h $(DIR_INC)
vpath %.h $(DIR_COMMON_INC)
vpath %.c $(DIR_SRC)

INCS := $(wildcard $(DIR_INC)/*.h)
C_SRCS := $(wildcard $(DIR_SRC)/*.c)
CPP_SRCS := $(wildcard $(DIR_SRC)/*.cpp)
C_OBJS := $(C_SRCS:.c=.o)
C_OBJS := $(patsubst $(DIR_SRC)/%,$(DIR_OBJ)/%,$(C_OBJS))
CPP_OBJS := $(CPP_SRCS:.cpp=.o)
CPP_OBJS := $(patsubst $(DIR_SRC)/%,$(DIR_OBJ)/%,$(CPP_OBJS))
OBJS := $(C_OBJS) $(CPP_OBJS)
C_DEPS := $(C_SRCS:.c=.dep)
CPP_DEPS := $(CPP_SRCS:.cpp=.dep)
DEPS := $(C_DEPS) $(CPP_DEPS)
DEPS := $(patsubst $(DIR_SRC)/%,$(DIR_OBJ)/%,$(DEPS))

OUTPUT := $(MODULE).a
OUTPUT := $(DIR_LIB)/$(OUTPUT)

MKDIR := mkdir
RMDIR := rm -rf
CC := gcc
C++ := g++

CFLAGS := -I$(DIR_INC) -I$(DIR_COMMON_INC)
ifeq ($(DEBUG), true)
CFLAGS += -g
endif

AR := ar
ARFLAGS := crs

all : $(OUTPUT)
	@echo "compile $< successfully."

$(OUTPUT) : $(OBJS)
	@$(AR) $(ARFLAGS) -o $@ $^

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.c
	@$(CC) $(CFLAGS) -o $@ -c $<

$(DIR_OBJ)/%.o : $(DIR_SRC)/%.cpp
	@$(C++) $(CFLAGS) -o $@ -c $<

-include $(DEPS)

$(DIR_OBJ)/%.dep : $(DIR_SRC)/%.c
	@set -e; \
	$(CC) $(CFLAGS) -MM -E $< | sed 's,\(.*\)\.o[ :]*,$(DIR_OBJ)/\1.o $@ : ,g' > $@

$(DIR_OBJ)/%.dep : $(DIR_SRC)/%.cpp
	@set -e; \
	$(C++) $(CFLAGS) -MM -E $< | sed 's,\(.*\)\.o[ :]*,$(DIR_OBJ)/\1.o $@ : ,g' > $@