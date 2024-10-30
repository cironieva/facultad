#include <stdio.h>
#include <stdbool.h>

int main(void) {
    
    printf("\nEJERCICIO 1\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int x, y, z;

    printf("x := ");
    scanf("%d", &x);

    printf("y := ");
    scanf("%d", &y);

    printf("z := ");
    scanf("%d", &z);

    int expresion1 = x + y + 1;
    int expresion2 = z * z + y * 45 - 15 * x;
    bool expresion3 = y - 2 == (x * 3 + 1) % 5;
    int expresion4 = y / 2 * x;
    bool expresion5 = y < x * z;

    printf("--------------------------------\n");


    printf("%d + %d + 1 = %d\n", x, y, expresion1);
    
    printf("%d * %d + %d * 45 - 15 * %d = %d\n", z, z, y, x, expresion2);
    
    if (expresion3) {
        printf("%d - 2 == (%d * 3 + 1) %% 5 = True\n", y, x);
    }
    else {
        printf("%d - 2 == (%d * 3 + 1) %% 5 = False\n", y, x);
    }
    
    printf("%d / 2 * %d = %d\n", y, x, expresion4);
    
    if (expresion5) {
        printf("%d < %d * %d = True\n", y, x, z);
    }
    else {
        printf("%d < %d * %d = False\n", y, x, z);
    }
    
    return 0;
}