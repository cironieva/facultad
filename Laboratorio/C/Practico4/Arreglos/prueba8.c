#include <stdio.h>

int pedir_arreglo(int t_max, int a[]) {
    int tam;
    printf("Tamaño del arreglo (max %d): ", t_max);
    scanf("%d", &tam);
    if (tam > t_max) {
        tam = t_max;
        printf("Tamaño fijado al máximo permitido.\n");
    }

    printf("Introduzca de a uno los elementos del arreglo\n");
    int i = 0;
    while (i < tam) {
        printf("Elemento nro %d: ", i+1);
        scanf("%d", &a[i]);
        i++;
    }
    return tam;
}

void imprimir_arreglo(int tam, int a[]) {
    int i = 0;
    printf("[");
    while (i < tam-1) {
        printf("%d,", a[i]);
        i++;
    }
    printf("%d]", a[i]);
}

int sumatoria(int tam, int a[]) {
    int suma = 0;
    int i = 0;
    while (i < tam) {
        suma += a[i];
        i++;
    }
    return suma;
}

int main(void) {
    
    int t_max = 10; // tamaño máximo del arreglo, modificar según se necesite.
    int arreglo[t_max];
    int tamaño = pedir_arreglo(t_max, arreglo);

    int suma = sumatoria(tamaño, arreglo);

    printf("La sumatoria de ");
    imprimir_arreglo(tamaño, arreglo);
    printf(" es %d\n", suma);
    
    return 0;
}
