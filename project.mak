.PHONY : all compile link clean rebuild $(MODULES)

ifeq (linux,$(OS))
define MAKE_MODULE
	@set -e; \
	cd $(1) && \
	$(MAKE) ROOT:=$(ROOT) \
		DIR_BUILD:=$(DIR_BUILD) \
		DIR_LIB:=$(DIR_LIB) \
		DEBUG:=$(DEBUG) && \
	cd ..
endef
else
define MAKE_MODULE
	@echo off && \
	cd $(1) && \
	$(MAKE) ROOT:=$(ROOT) \
		DIR_BUILD:=$(DIR_BUILD) \
		DIR_LIB:=$(DIR_LIB) \
		DEBUG:=$(DEBUG) && \
	cd ..
endef
endif

all : compile $(TARGET)
	@echo "compile completely."

compile : $(DIR_BUILD) $(DIR_LIB) $(DIR_MODULES) $(MODULES)

ifeq (,$(MAKECMDGOALS))
$(MODULES) : $(DIR_BUILD) $(DIR_LIB)
	$(call MAKE_MODULE, $@)
else
$(MODULES) : $(DIR_BUILD) $(DIR_LIB) $(DIR_BUILD)/$(MAKECMDGOALS)
	$(call MAKE_MODULE, $@)
endif

ifeq (linux,$(OS))
$(DIR_BUILD) $(DIR_LIB) $(DIR_MODULES) $(DIR_TARGET):
	@set -e; \
	cd $(dir $@) && \
	$(MKDIR) $(notdir $@) && \
	cd $(ROOT)
else
$(DIR_BUILD) $(DIR_LIB) $(DIR_MODULES) $(DIR_TARGET):
	@echo off && \
	cd $(dir $@) && \
	$(MKDIR) $(notdir $@) && \
	cd $(ROOT)
endif

link $(TARGET) : $(DIR_BUILD) $(DIR_TARGET) $(LIBS) $(EXTEND_LIB)
	@$(CC) -o $(TARGET) -Xlinker "-(" $(LIBS) -Xlinker "-)" $(LFLAGS)

ifeq (linux, $(OS))
$(DIR_LIB)/% : $(DIR_EXTEND_LIB)/%
	@$(CP) $^ $@
else
$(DIR_LIB)$\% : $(DIR_EXTEND_LIB)$\%
	@$(CP) $^ $@
endif

clean :
	@$(RMDIR) $(DIR_BUILD)

rebuild :
	@$(MAKE) clean
	@$(MAKE)