
all: main.cpp
	g++ -L. -lrhstr main.cpp -o main

lib:
	g++ -c rhstr.cpp -o rhstr.o
	ar -rv librhstr.a rhstr.o
