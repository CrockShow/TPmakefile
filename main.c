/** Fichier de definition du programme principal
    faisant appel aux differentes fonctions disponibles
    dans les bibliotheques libaddition, libsoustraction,
    libmultiplication et libdivision.
    @author Gregory DAVID
*/
#include <stdio.h>
#include "fonctions.h"

int main(void){
  int a, b;
  a = 12345;
  b = 98765;
  printf("%i + %i = %li\n", a, b, addition(a, b));
  printf("%i - %i = %li\n", a, b, soustraction(a, b));
  printf("%i * %i = %lli\n", a, b, multiplication(a, b));
  printf("%i / %i = %f\n", a, b, division(a, b));
  return 0;
}
