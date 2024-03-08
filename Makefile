#------------------------------------#
#               Project              #
#------------------------------------#
TARGET		=	libasm.a
PROJDIR		=	$(realpath $(CURDIR))
SRCDIR		=	$(PROJDIR)/srcs
INCDIR		=	$(PROJDIR)/incs
OBJDIR		=	$(PROJDIR)/objs

#------------------------------------#
#               Compiler             #
#------------------------------------#
CASM		=	nasm -f elf64
INCLUDE		=	-I $(INCDIR)

#------------------------------------#
#                Files               #
#------------------------------------#
SRCS		=	$(shell find $(SRCDIR) -type f -name '*'.s)
OBJS		=	$(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SRCS:.s=.o))

#------------------------------------#
#                Rules               #
#------------------------------------#
all : $(TARGET)

$(TARGET) : $(OBJS)
	@ar -rcs $@ $^
	@echo Creating library $@

$(OBJDIR)/%.o : $(SRCDIR)/%.s
	@mkdir -p $(dir $@)
	@$(CASM) $< -o $@
	@echo Building $(notdir $@)

test : $(TARGET) $(PROJDIR)/main.c
	@gcc -g -o test main.c $< -I $(INCDIR)
	@echo Building test

clean :
	@rm -rf $(OBJDIR)
	@rm -rf $(DEPDIR)
	@echo Cleaning $(OBJDIR) $(DEPDIR)

fclean : clean
	@rm -f $(TARGET)
	@echo Cleaning $(TARGET)

re : fclean all

.PHONY : all clean fclean re
