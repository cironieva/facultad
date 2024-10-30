#include <stdio.h>
#include <stdbool.h>

int main(void) {
    
    printf("\nEJERCICIO 2\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int x, y, z;
    bool b, w;

    // valores encontrados para satisfacer la consigna
    x = 4;
    y = (-4);
    z = 8;
    b = true;
    w = true;

    bool expresion1 = x % 4 == 0;
    bool expresion2 = x + y == 0 && y - x == (-1) * z;
    bool expresion3 = !b && w;

    

    if (expresion1) {
        printf("%d %% 4 == 0 = True\n", x);
    }
    else {
        printf("%d %% 4 == 0 = False\n", x);
    }

    if (expresion2) {
        printf("%d + %d == 0 && %d - %d == (-1) * %d = True\n", x, y, y, x, z);
    }
    else {
        printf("%d + %d == 0 && %d - %d == (-1) * %d = False\n", x, y, y, x, z);
    }

    if (expresion3) {               // no hay %b para booleanos
        printf("!b && w = True\n"); 
    }
    else {
        printf("!b && w = False\n");
    }
    
    return 0;
}