#include <stdio.h>

int main(void) {
    
    printf("\nEJERCICIO 5\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int x, y;

    printf("x := ");
    scanf("%d", &x);

    printf("y := ");
    scanf("%d", &y);


    // Programa 3abc)

    printf("\nPrograma 3abc)\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("E0: x = %d, y = %d\n", x, y);
    
    if (x >= y) {
        x = 0;
    }
    else if (x <= y) {
        x = 2;
    }

    // en caso de x == y, se ejecuta la primera guarda verdadera.

    printf("E1: x = %d, y = %d\n", x, y);

    return 0;
}