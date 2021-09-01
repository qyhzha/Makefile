
ifeq (,$(findstring Windows,$(OS)))
OS := linux
else
OS := win32
endif

MKDIR := mkdir
ifeq (linux, $(OS))
RMDIR := rm -rf
else
RMDIR := rd /s/q
endif
CC := gcc
C++ := g++
ifeq (linux, $(OS))
CP := cp
else
CP := copy
endif

MODULE := $(notdir $(DIR_CURRENT))
DIR_OBJ := $(DIR_BUILD)/$(MODULE)
OUTPUT := $(MODULE).a
OUTPUT := $(DIR_LIB)/$(OUTPUT)

OBJS := $(SOURCE_FILES)
OBJS := $(OBJS:.c=.o)
OBJS := $(OBJS:.cpp=.o)
OBJS := $(addprefix $(DIR_OBJ)/,$(OBJS))
DEPS := $(SOURCE_FILES)
DEPS := $(DEPS:.c=.dep)
DEPS := $(DEPS:.cpp=.dep)
DEPS := $(addprefix $(DIR_OBJ)/,$(DEPS))

ifneq (linux, $(OS))
ROOT := $(subst /,\,$(ROOT))
DIR_BUILD := $(subst /,\,$(DIR_BUILD))
DIR_EXTEND_LIB := $(subst /,\,$(DIR_EXTEND_LIB))
DIR_LIB := $(subst /,\,$(DIR_LIB))
DIR_MODULES := $(subst /,\,$(DIR_MODULES))
DIR_TARGET := $(subst /,\,$(DIR_TARGET))
LIBS := $(subst /,\,$(LIBS))
EXTEND_LIB := $(subst /,\,$(EXTEND_LIB))
TARGET := $(subst /,\,$(TARGET))

DIR_INC := $(subst /,\,$(DIR_INC))
DIR_SRC := $(subst /,\,$(DIR_SRC))
DIR_OBJ := $(subst /,\,$(DIR_OBJ))
SOURCE_FILES := $(subst /,\,$(SOURCE_FILES))
OBJS := $(subst /,\,$(OBJS))
DEPS := $(subst /,\,$(DEPS))
OUTPUT := $(subst /,\,$(OUTPUT))
endif

DIR_INC := $(addprefix -I,$(DIR_INC))

CFLAGS += -MMD $(DIR_INC)
ifeq ($(DEBUG), true)
CFLAGS += -g
endif

AR := ar
ARFLAGS := crs

LFLAGS +=