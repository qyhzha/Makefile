.PHONY : all compile link clean rebuild $(MODULES)

MODULES := Main \
           Module \
           Common

ROOT := $(realpath .)
DIR_BUILD := Build
DIR_LIB := $(DIR_BUILD)/Lib
DIR_TARGET := $(DIR_BUILD)/Target
DIR_MODULES := $(addprefix $(DIR_BUILD)/,$(MODULES))
DIR_COMMON_INC := Common/inc
DIR_EXTEND_LIB := lib/lib

LIBS := $(addsuffix .a,$(MODULES))
LIBS := $(addprefix $(DIR_LIB)/,$(LIBS))
EXTEND_LIB := $(wildcard $(DIR_EXTEND_LIB)/*)
EXTEND_LIB := $(patsubst $(DIR_EXTEND_LIB)/%,$(DIR_LIB)/%,$(EXTEND_LIB))
TARGET := $(DIR_TARGET)/target.exe

CONFIG_MAK := Config.mak
CMD_MAK := Cmd.mak
BUILD_MAK := Build.mak

define MAKE_MODULE
	cd $(1) && \
	$(MAKE) DIR_BUILD:=$(ROOT)/$(DIR_BUILD) \
			DIR_LIB:=$(ROOT)/$(DIR_LIB) \
			DIR_COMMON_INC:=$(ROOT)/$(DIR_COMMON_INC) \
			CONFIG_MAK:=$(ROOT)/$(CONFIG_MAK) \
			CMD_MAK:=$(ROOT)/$(CMD_MAK) \
			BUILD_MAK:=$(ROOT)/$(BUILD_MAK) \
			DEBUG:=$(DEBUG) && \
	cd ..;
endef


include Cmd.mak

all : compile $(TARGET)
	@echo "compile completely."

compile : $(DIR_BUILD) $(DIR_LIB) $(DIR_MODULES)
	@set -e; \
	for dir in $(MODULES); \
	do \
		$(call MAKE_MODULE, $$dir) \
	done

$(MODULES) : $(DIR_BUILD) $(DIR_LIB) $(DIR_BUILD)/$(MAKECMDGOALS)
	@set -e; \
	$(call MAKE_MODULE, $@)

$(DIR_BUILD) $(DIR_LIB) $(DIR_TARGET) $(DIR_MODULES):
	@$(MKDIR) $@

link $(TARGET) : $(DIR_BUILD) $(DIR_TARGET) $(LIBS) $(EXTEND_LIB)
	@$(C++) -o $(TARGET) -Xlinker "-(" $(LIBS) -Xlinker "-)" $(LFLAGS)

$(DIR_LIB)/% : $(DIR_EXTEND_LIB)/%
	@$(CP) $^ $@

clean :
	@$(RMDIR) $(DIR_BUILD)
	@echo "clean completely"

rebuild :
	@$(MAKE) clean
	@$(MAKE) all