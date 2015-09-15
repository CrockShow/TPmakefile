CC=gcc
Class+=-Wall
soname+=-soname
fonctions+=addition.o soustraction.o multiplication.o division.o


libarithmetique_library.a : $(fonctions)
	ar rcs libarithmetique_library.a $(fonctions)
	
libarithmetique_library.so.1.0.0 : $(fonctions)
	$(CC) -shared -fPIC -Wl,$(soname),libarithmetique_library.so.1 -o libarithmetique_library.so.1.0.0 $(fonctions) -lc
	ln -sf libarithmetique_library.so.1.0.0 libarithmetique_library.so.1
	ln -sf libarithmetique_library.so.1.0.0 libarithmetique_library.so
	
arithmetique : libarithmetique_library.a libarithmetique_library.so.1.0.0
	$(CC) -c $(Class) main.c
	$(CC) -o arithmetique.static main.o -L. -l:libarithmetique_library.a
	$(CC) -o arithmetique main.o -L. -larithmetique_library
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./arithmetique
