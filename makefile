vpath %.c ./src
vpath %.h ./inc

CC = gcc_S
SRC_PATH = ./src/
LINK_TARGET = app.exe
INCLUDE_PATH = ./inc/
DEPENDENCY_PATH = Dependencies/
Immortal_Object=code.o
SRCS= main.c LCD.c DIO.c
OBJ = $(SRCS:.c=.o) 
DEPS= $(SRCS:.c=.d) 
CLEAN_TARGET = $(LINK_TARGET) $(OBJ) $(DEPS)

$(LINK_TARGET) : CFLAGS =
$(OBJ) : CFLAGS = -c
$(DEPS) : CFLAGS = -MM


.PHONY : all clean depend

all:$(LINK_TARGET)
	echo Building done !

clean:
	-rm  $(CLEAN_TARGET)
	echo Cleaning done !

depend:$(DEPS)

$(LINK_TARGET): $(OBJ) $(Immortal_Object)
# name of the specified object file should be explicitly added here
	$(CC) $(CFLAGS) $(OBJ) $(Immortal_Object) -o $@
# and here also
	echo Linking done !

%.o:%.c
	$(CC) $(CFLAGS) -I$(INCLUDE_PATH) $< -o $@

%.d : %.c
	$(CC) $(CFLAGS) -I$(INCLUDE_PATH) $< -o $@ 

-include $(DEPS)