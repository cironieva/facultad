#include <stdio.h>

int pedir_arreglo(int t_max, int arreglo[]) {
    int tamaño;
    printf("Ingrese el tamaño del arreglo (máximo %d): ", t_max);
    scanf("%d", &tamaño);

    if (tamaño > t_max) {
        printf("El tamaño excede el máximo permitido. Se usará el tamaño máximo %d.\n", t_max);
        tamaño = t_max;
    }

    int indice = 0;
    while (indice < tamaño) {
        printf("Ingrese el elemento %d: ", indice + 1);
        scanf("%d", &arreglo[indice]);
        indice++;
    }

    return tamaño;
}

void imprimir_arreglo(int tamaño, int arreglo[]) {
    
    int indice = 0;

    while (indice < tamaño){
        if (indice == 0) {
            printf("[%d,", arreglo[indice]);
        }
        else if (indice == tamaño- 1) {
            printf("%d]", arreglo[indice]);
        }
        else {
            printf("%d,", arreglo[indice]);
        }
        indice ++;
    }
}

int sumar_arreglo(int tamaño, int arreglo[]) {
    int suma = 0;
    int i = 0;
    while (i < tamaño) {
        suma += arreglo[i];
        i++;
    }
    return suma;
}

int main(void) {

    // tamaño máximo para arreglos (modificar según se necesite):
    int t_max = 10;

    int arreglo[t_max];

    int tamaño = pedir_arreglo(t_max, arreglo);

    int suma = sumar_arreglo(tamaño, arreglo);

    printf("La sumatoria de ");
    imprimir_arreglo(tamaño, arreglo);
    printf(" es %d\n", suma);

    return 0;
}