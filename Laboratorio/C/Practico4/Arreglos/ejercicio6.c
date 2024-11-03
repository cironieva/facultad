#include <stdio.h>
#include <assert.h>

void intercambiar(int tam, int a[], int i, int j) {
    
    if (0 <= i && i < tam) {
        printf("La primer posición no está en el arreglo\n");
    }

    if (0 <= i && i < tam) {
        printf("La segunda posición no está en el arreglo\n");
    }
    
    int temp = a[i];
    a[i] = a[j];
    a[j] = temp;
}

int main(void) {

    printf("Se intercambiarán dos posiciones de su arreglo\n");

    int tam;
    printf("Tamaño del arreglo: ");
    scanf("%d", &tam);

    int a[tam];

    printf("Introduzca uno por uno los elementos de su arreglo\n");

    int pos = 0;
    while (pos < tam) {
        printf("Elemento nro %d: ", pos+1);
        scanf("%d", &a[pos]);
        pos ++;
    }
    pos = 0;

    int i;
    printf("Primera posición a intercambiar [0, %d]: ", tam-1);
    scanf("%d", &i);
    
    int j;
    printf("Segunda posición a intercambiar [0, %d]: ", tam-1);
    scanf("%d", &j);

    assert(0 <= i && i < tam && 0 <= j && j < tam);

    printf("original = ");
    
    while (pos < tam)
    {
        if (pos == 0) {
            printf("[%d,", a[pos]);
        }
        else if (pos == tam - 1) {
            printf("%d]\n", a[pos]);
        }
        else {
            printf("%d,", a[pos]);
        }
        pos ++;
    }
    
    pos = 0;

    intercambiar(tam, a, i, j);

    printf("alterado = ");

    while (pos < tam)
    {
        if (pos == 0) {
            printf("[%d,", a[pos]);
        }
        else if (pos == tam - 1) {
            printf("%d]\n", a[pos]);
        }
        else {
            printf("%d,", a[pos]);
        }
        pos ++;
    }

    return 0;
}