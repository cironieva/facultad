#include <stdio.h>

int main(void) {
    
    int arreglo[4];

    printf("Introduzca uno por uno los elementos de su arreglo:\n");

    int j = 0;
    while (j < 4) {
        printf("Elemento nro %d = ", j+1);
        scanf("%d", &arreglo[j]);
        j ++;
    }
    
    int i = 0;
    int s = 0;
    int c = 0;
    
    while (i < 4)
    {
        s += arreglo[i];
        i ++;
    }

    i = 0;
    
    printf("La sumatoria del arreglo es = %d\n", s);

    while (i < 4)
    {
        if (arreglo[i] > 0) c++;
        i ++;
    }

    printf("La cantidad de elementos positivos del arreglo es = %d\n", c);

    return 0;
}
