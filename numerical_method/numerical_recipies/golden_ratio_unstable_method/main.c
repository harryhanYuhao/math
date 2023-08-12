#include <stdio.h>

int main(){
  double nMinus1 = 1;
  double n = 0.61803398;
  double nPlus1;

  for (int i = 0; i < 100; i++){
    nPlus1 = nMinus1 - n;
    nMinus1 = n;
    n = nPlus1;
    printf("%8.10lf\n", nPlus1);
  }
}
