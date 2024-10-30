#include <stdio.h>
#include <assert.h>

int pedir_entero(char name) {
    int n;
    printf("%c = ", name);
    scanf("%d", &n);
    return n;
}

int minimo (int x, int y) {
    if (x <= y) {
        return x;
    }
    else {
        return y;
    }
}

int modulo (int x) {
    if (x >= 0) {
        return x;
    }
    else {
        return -x;
    }
}

int main(void) {
    
    printf("\nEJERCICIO 2\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    // Inciso 1
    printf("\nInciso 1\n");
    printf("¯¯¯¯¯¯¯¯\n");

    int x = pedir_entero('x');
    int y = pedir_entero('y');

    assert (x >= y || x <= y);

    printf("min (%d, %d) = %d\n", x, y, minimo(x, y));
    
    assert (minimo(x,y) <= x || minimo(x,y) <= y);

    // Inciso 2
    printf("\nInciso 2\n");
    printf("¯¯¯¯¯¯¯¯\n");

    x = pedir_entero('x');

    assert (x >= 0 || x < 0);

    printf("|%d| = %d\n", x, modulo(x));
    
    assert (modulo(x) >= 0);
    
    return 0;
}