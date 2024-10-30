#include <stdio.h>

int pedir_entero(char name) {
    int n;
    printf("%c = ", name);
    scanf("%d", &n);
    return n;
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

int main(void) {
    printf("\nEJERCICIO 5\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int n = pedir_entero('n');
    if (n < 0) {
        printf("el número debe ser positivo\n");
    }
    else {
        printf("la suma de los %d primeros naturales es: %d\n", n, suma_hasta(n));
    }

    return 0;
}