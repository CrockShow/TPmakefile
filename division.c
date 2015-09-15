/** Fichier de definition de la fonction disponible
    dans la bibliotheque libdivision
    @author Gregory DAVID
*/
#include "fonctions.h"
float division(int dividende, int diviseur){
  if(diviseur != 0){
    return dividende / (float)diviseur;
  }
  else{
    return 0.0;
  }
}
