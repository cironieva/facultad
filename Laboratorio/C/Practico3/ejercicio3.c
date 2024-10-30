#include <stdio.h>

int main(void) {
    
    printf("\nEJERCICIO 3\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int xInput, yInput;

    printf("x := ");
    scanf("%d", &xInput);

    printf("y := ");
    scanf("%d", &yInput);

    int x = xInput;
    int y = yInput;

    // Programa 1a)

    printf("\nPrograma 1a)\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("E0: x = %d\n", xInput);
    x = 5;
    printf("E1: x = %d\n", x);

    // Programa 1b)

    printf("\nPrograma 1b)\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("E0: x = %d, y = %d\n", xInput, yInput);
    x = xInput + yInput;
    y = yInput + yInput;
    printf("E1: x = %d, y = %d\n", x, y);

    // Programa 1c)

    printf("\nPrograma 1c)\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("E0: x = %d, y = %d\n", xInput, yInput);
    y = yInput + yInput;
    x = xInput + y;
    printf("E1: x = %d, y = %d\n", x, y);

    return 0;
}