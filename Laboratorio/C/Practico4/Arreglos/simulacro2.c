#include <stdio.h>
#include <stdbool.h>

#define N 5

typedef struct {
    int cant_v;
    int cant_pares;
    int cant_imp;
    bool hay_8;
} datos;


datos llenar_estructura(int a[], int tam, int v) {
    
    int impares = 0;
    int pares = 0;
    int cantV = 0;
    bool hay8 = false;
    
    int i = 0;
    while (i < tam) {
        if (a[i] % 2 == 0) {
            pares ++;
            if (a[i] == 8) hay8 = true;
        } else {
            impares ++;
        }
        if (a[i] == v) cantV++;
        i++;
    }
    
    datos res;
    res.cant_imp = impares;
    res.cant_pares = pares;
    res.cant_v = cantV;
    res.hay_8 = hay8;

    return res;
}

void pedir_arreglo(int a[], int tam) {
    printf("Introduzca de a uno los elementos del arreglo\n");
    int i = 0;
    while (i < tam) {
        printf("Elemento nro %d: ", i+1);
        scanf("%d", &a[i]);
        i++;
    }
}

int main(void) {
    int arr[N];
    pedir_arreglo(arr, N);

    int v;
    printf("v = ");
    scanf("%d", &v);

    datos res = llenar_estructura(arr, N, v);
    
    printf("-----------------------\n");
    printf("Cantidad de impares: %d\n", res.cant_imp);
    printf("Cantidad de pares: %d\n", res.cant_pares);
    printf("Cantidad de %ds: %d\n", v, res.cant_v);
    printf("Hay al menos un 8: ");
    if (res.hay_8) {
        printf("sí\n");
    }
    else {
        printf("no\n");
    }

}
