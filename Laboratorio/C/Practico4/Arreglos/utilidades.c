#include <stdio.h>
#include <stdbool.h>
#include <limits.h>

int pedir_entero(char name) {
    int n;
    printf("%c = ", name);
    scanf("%d", &n);
    return n;
}

void imprimir_entero(char name, int n) {
    printf("%c = %d\n", name, n);
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

int pedir_arreglo_tam(int t_max, int a[]) {
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

typedef struct {
    int op_sum;
    int op_mul;
    int op_div;
    int op_dist;
} info_t;

info_t operar(int x, int y) {
    info_t res;
    res.op_sum = x + y;
    res.op_mul = x * y;
    res.op_div = div_ent(x, y).cociente;
    res.op_dist = val_abs(x - y);

    return res;
}

int suma_hasta(int n) {
    int suma = 0;
    int i = 1;
    while (i <= n) {
        suma += i;
        i++;
    }
    return suma;
}

typedef struct {
    int cociente;
    int resto;
} div_res;

div_res div_ent (int x, int y) {

    int q = 0;

    while (x >= y) {
        x -= y;
        q ++;
    }
    
    div_res resultado;
    resultado.cociente = q;
    resultado.resto = x;

    return resultado;
}


bool es_primo (int n) {

    if (n < 2) return false; // por definición

    int i = 2;
    bool primalidad = true;

    while (primalidad && i < n) {
        primalidad = n % i != 0;
        i ++;
    }

    return primalidad;
}

int n_esimo_primo(int n) {
    int count = 0;              // debe iniciar en 0
    int num = 1;                // acá podría ir cualquier num < 2
    while (count < n) {
        num++;                  // Es importante que esto esté primero
        if (es_primo(num)) {    // y esto segundo
            count++;
        }
    }
    return num;

    // num es un número primo
    // count es el ordinal de ese número
}

#define N 10 // por fuera de main

int main(void) {
    
    // EL USUARIO NO ELIGE EL TAMAÑO

    int arr[N];
    pedir_arreglo(arr, N);


    // EL USUARIO ELIGE EL TAMAÑO

    int t_max = N;
    int arreglo[t_max];
    int tamaño = pedir_arreglo_tam(t_max, arreglo);

    // así se usa una función struct
    
    // info_t res = operar(x,y);
    // int suma = res.op_sum;


    return 0;
}