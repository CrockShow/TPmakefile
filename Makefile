CC :=gcc
CCoption+=-shared -fPIC -Wl
Class+=-Wall
soname+=-soname
fonctions+=addition.o soustraction.o multiplication.o division.o
lib1=$(soname)$(lbmajor)
lib100=$(soname)$(lbmajor)$(lbmineur)$(lbcor)
liba=$(libarith).a
ar+=ar
ln+=ln
soname=$(libarith).so
lbmajor=.1
lbmineur=.0
lbcor=.0
libarith=lib$(arith)_library
arith=arithmetique
main=main

$(liba) : $(fonctions)
	$(ar) rcs $(liba) $(fonctions)
	
$(lib100) : $(fonctions)
	$(CC) $(CCoption),$(soname),$(lib1) -o $(lib100) $(fonctions) -lc
	$(ln) -sf $(lib100) $(lib1)
	$(ln) -sf $(lib100) $(soname)
	
arithmetique.static : $(liba)
	$(CC) -c $(Class) $(main).c
	$(CC) -o $(arith).static $(main).o -L. -l:$(liba)
	
arithmetique : $(lib100)
	$(CC) -o arithmetique $(main).o -L. -l$(arith)_library
	LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH ./arithmetique
