#include <stdio.h>
#include <limits.h>
#include <stdbool.h>

int minimo_pares(int tam, int a[]) {
    int minimo = INT_MAX;
    int i = 0;
    while (i < tam) {
        if (a[i] % 2 == 0 && a[i] < minimo) {
            minimo = a[i];
        }
        i ++;
    }
    return minimo;
}

int minimo_impares(int tam, int a[]) {
    int minimo = INT_MAX;
    int i = 0;
    while (i < tam) {
        if (a[i] % 2 != 0 && a[i] < minimo) {
            minimo = a[i];
        }
        i ++;
    }
    return minimo;
}

int minimo(int a, int b) {
    if (a <= b) return a;
    return b; 
}

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





int main(void) {
    // tamaño máximo para arreglos (modificar según se necesite):
    int t_max = 10;
    int arreglo[t_max];
    int tamaño = pedir_arreglo(t_max, arreglo);

    int menor_par = minimo_pares(tamaño, arreglo);
    int menor_impar = minimo_impares(tamaño, arreglo);
    int menor = minimo(menor_par, menor_impar);


    if (menor_par == INT_MAX) {
        printf("No hay elementos pares\n");
    }
    else {
        printf("El menor elemento par del arreglo es: %d\n", menor_par);

    }
    
    if (menor_impar == INT_MAX) {
        printf("No hay elementos impares\n");
    }
    else {
        printf("El menor elemento impar del arreglo es: %d\n", menor_impar);
    }

    printf("Por lo tanto, el menor elemento es: %d\n", menor);
    
    return 0;
}