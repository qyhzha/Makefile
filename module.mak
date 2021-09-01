.PHONY : all

MODULE := $(notdir $(DIR_CURRENT))
DIR_OBJ := $(DIR_BUILD)/$(MODULE)
OUTPUT := $(MODULE).a
OUTPUT := $(DIR_LIB)/$(OUTPUT)

vpath %.h $(DIR_INC)
vpath %.c $(DIR_SRC)

OBJS := $(SOURCE_FILES)
OBJS := $(OBJS:.c=.o)
OBJS := $(OBJS:.cpp=.o)
OBJS := $(addprefix $(DIR_OBJ)/,$(OBJS))
DEPS := $(SOURCE_FILES)
DEPS := $(DEPS:.c=.dep)
DEPS := $(DEPS:.cpp=.dep)
DEPS := $(addprefix $(DIR_OBJ)/,$(DEPS))

all : $(OUTPUT)

$(OUTPUT) : $(OBJS)
	@$(AR) $(ARFLAGS) $@ $^

$(DIR_OBJ)/%.o : %.c $(MAKEFILE_LIST)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(DIR_OBJ)/%.o : %.cpp $(MAKEFILE_LIST)
	@$(C++) $(CFLAGS) -o $@ -c $<

-include $(DEPS)
