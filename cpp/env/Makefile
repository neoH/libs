
TEST := 0
T := options

Lib := ../lib$(T).a
Tar := obj

CDIR := $(shell pwd)

CC := g++

relies := $(shell find $(T) -mindepth 1 -type f -name "*.cpp")
lib_relies := $(shell find $(T) -mindepth 1 -type f -name "*.cpp" | grep -v "main.cpp")


ARGS   :=
ARGS   += -I $(T)

# generate executable test obj
$(Tar): $(relies)



# generating a lib file
lib: $(lib_relies)
	$(CC) $(ARGS) -c $(lib_relies) -o $(T).o
	$(AR) rv $(Lib) $(T).o
	rm -rf $(T).o

##all:
##	echo nothing done here
##
##
##options: Opts/options.h Opts/options.cpp
##	$(CC) -I Opts/ -c options.h options.cpp -o options.o
##	$(AR) rv libopt options.o
##	rm -rf options.o


self-test:
	echo CDIR: $(CDIR)
	echo T: $(T)
	echo Tar: $(Tar)
	echo relies: $(relies)
	echo ARGS: $(ARGS)
	echo lib_relies: $(lib_relies)


#.SILENT:
