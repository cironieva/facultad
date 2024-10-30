#include <stdio.h>

int main(void) {
    
    printf("\nEJERCICIO 4\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int xInput, yInput;

    printf("x := ");
    scanf("%d", &xInput);

    printf("y := ");
    scanf("%d", &yInput);

    int x = xInput;
    int y = yInput;

    // Programa 1d)

    printf("\nPrograma 1d)\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("E0: x = %d, y = %d\n", xInput, yInput);
    y = yInput + yInput;
    x = xInput + yInput;
    printf("E1: x = %d, y = %d\n", x, y);

    return 0;
}