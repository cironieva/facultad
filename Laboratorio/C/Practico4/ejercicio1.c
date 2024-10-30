#include <stdio.h>

int pedir_entero(char name) {
    int n;
    printf("%c = ", name);
    scanf("%d", &n);
    return n;
}

void imprimir_entero(char name, int n) {
    printf("%c = %d\n", name, n);
}

int main(void) {
    
    printf("\nEJERCICIO 1\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int x = pedir_entero('x');
    int y = pedir_entero('y');
    int z = pedir_entero('z');

    z = x;
    x = y;
    y = z;

    printf("-----------\n");

    imprimir_entero('x', x);
    imprimir_entero('y', y);
    imprimir_entero('z', z);
    
    return 0;
}