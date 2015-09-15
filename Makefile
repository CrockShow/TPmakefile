CC=gcc


libarithmetique_library.a : addition.o soustraction.o multiplication.o division.o
	ar rcs libarithmetique_library.a addition.o soustraction.o division.o multiplication.o
	
libarithmetique_library.so.1.0.0 : addition.o soustraction.o multiplication.o division.o 
	$(CC) -shared -fPIC -Wl,-soname,libarithmetique_library.so.1 -o libarithmetique_library.so.1.0.0 addition.o soustraction.o division.o multiplication.o -lc
	ln -sf libarithmetique_library.so.1.0.0 libarithmetique_library.so.1
	ln -sf libarithmetique_library.so.1.0.0 libarithmetique_library.so
	
arithmetique : libarithmetique_library.a libarithmetique_library.so.1.0.0
	$(CC) -c -Wall main.c
	$(CC) -o arithmetique.static main.o -L. -l:libarithmetique_library.a
	$(CC) -o arithmetique main.o -L. -larithmetique_library
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./arithmetique
