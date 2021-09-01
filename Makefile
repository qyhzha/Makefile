
MODULES := Main \
           Module \
           Common

ROOT := $(realpath .)
DIR_BUILD := $(ROOT)/Build
DIR_EXTEND_LIB := Lib/lib

DIR_LIB := $(DIR_BUILD)/Lib
DIR_MODULES := $(addprefix $(DIR_BUILD)/,$(MODULES))
DIR_TARGET := $(DIR_BUILD)/Target

LIBS := $(addsuffix .a,$(MODULES))
LIBS := $(addprefix $(DIR_LIB)/,$(LIBS))
EXTEND_LIB := $(wildcard $(DIR_EXTEND_LIB)/*)
EXTEND_LIB := $(patsubst $(DIR_EXTEND_LIB)/%,$(DIR_LIB)/%,$(EXTEND_LIB))
TARGET := $(DIR_TARGET)/target.exe

LFLAGS := $(EXTEND_LIB)

include env.mak
include project.mak