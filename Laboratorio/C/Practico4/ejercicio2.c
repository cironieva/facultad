#include <stdio.h>
#include <assert.h>

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
    
    printf("\nEJERCICIO 2\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    // Inciso 1
    printf("\nInciso 1\n");
    printf("¯¯¯¯¯¯¯¯\n");

    int xInput = pedir_entero('x');
    int x = xInput;
    int yInput = pedir_entero('y');
    int y = yInput;

    assert (x == xInput && y == yInput);

    x = x + 1;
    y = xInput + y;

    assert (x == xInput + 1 && y == xInput + yInput);

    printf("--------\n");

    imprimir_entero('x', x);
    imprimir_entero('y', y);

    // Inciso 2
    printf("\nInciso 2\n");
    printf("¯¯¯¯¯¯¯¯\n");

    xInput = pedir_entero('x');
    x = xInput;
    yInput = pedir_entero('y');
    y = yInput;
    int zInput = pedir_entero('z');
    int z = zInput;

    assert(x == xInput && y == yInput && z == zInput);

    x = y;
    y = y + xInput + z;
    z = yInput + xInput;

    assert(x == yInput && y == yInput + xInput + zInput && z == yInput + xInput);

    printf("--------\n");

    imprimir_entero('x', x);
    imprimir_entero('y', y);
    imprimir_entero('z', z);

    return 0;
}