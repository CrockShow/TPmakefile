CC :=gcc
CCoption+=-shared -fPIC -Wl
Class+=-Wall
soname+=-soname
fonctions+=addition.o soustraction.o multiplication.o division.o
lib1=libarithmetique_library.so.1
lib100=libarithmetique_library.so.1.0.0
liba=libarithmetique_library.a
ar+=ar
ln+=ln


libarithmetique_library.a : $(fonctions)
	$(ar) rcs $(liba) $(fonctions)
	
libarithmetique_library.so.1.0.0 : $(fonctions)
	$(CC) $(CCoption),$(soname),$(lib1) -o $(lib100) $(fonctions) -lc
	$(ln) -sf $(lib100) $(lib1)
	$(ln) -sf $(lib100) libarithmetique_library.so
	
arithmetique.static : $(liba)
	$(CC) -c $(Class) main.c
	$(CC) -o arithmetique.static main.o -L. -l:$(liba)
	
arithmetique : $(lib100)
	$(CC) -o arithmetique main.o -L. -larithmetique_library
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./arithmetique
