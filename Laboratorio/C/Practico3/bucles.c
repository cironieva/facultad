#include <stdio.h>
#include <stdbool.h>

int main(void) {
    
    // División entera

    printf("División entera\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\n");


    int a, b, q, r;

    printf("Numerador = ");
    scanf("%d", &a);
    printf("Denominador = ");
    scanf("%d", &b);

    q = 0;
    r = a;

    while (r >= b) {
        r = r - b;
        q = q + 1;
    }

    printf("\n%d = %d * %d + %d\n", a, b, q, r);


    // Número primo

    printf("\nNúmero primo\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯¯\n");

    int n, i;
    bool primalidad;

    printf("n = ");
    scanf("%d", &n);

    i = 2;
    primalidad = true;

    while (primalidad && i < n) {
        primalidad = n % i != 0;
        i = i + 1;
    }
    
    if (n >= 2 && primalidad) {
        printf("Es primo\n");
    }
    else {
        printf("No es primo\n");
    }

    return 0;
}
