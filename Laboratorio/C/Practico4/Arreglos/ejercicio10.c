#include <stdio.h>
#include <stdbool.h>

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

bool todos_pares(int tamaño, int arreglo[]) {
    int i = 0;
    while (i < tamaño) {
        if (arreglo[i] % 2 != 0) {
            return false;
        }
        i++;
    }
    return true;
}

bool existe_multiplo(int m, int tamaño, int arreglo[]) {
    int i = 0;
    while (i < tamaño) {
        if (arreglo[i] % m == 0) {
            return true;
        }
        i++;
    }
    return false;
}

int main(void) {
    // tamaño máximo para arreglos (modificar según se necesite):
    int t_max = 10;
    int arreglo[t_max];
    int tamaño = pedir_arreglo(t_max, arreglo);

    int eleccion;
    printf("¿Qué le gustaría hacer?\n");
    printf("1. Saber si todos los elementos son pares\n");
    printf("2. Saber si existe el múltiplo de un número\n");
    printf("Elija 1 o 2: ");
    scanf("%d", &eleccion);

    if (eleccion == 1) {
        if (todos_pares(tamaño, arreglo)) {
            printf("Todos los elementos son pares.\n");
        }
        else {
            printf("Hay al menos un elemento impar.\n");
        }
    }
    else {
        int m;
        printf("Introduzca ese número: ");
        scanf("%d", &m);
        
        if (existe_multiplo(m, tamaño, arreglo)) {
            printf("Hay al menos un múltiplo de %d en el arreglo.\n", m);
        }
        else {
            printf("No hay ningún múltiplo de %d en el arreglo.\n", m);
        }
    }

    return 0;
}