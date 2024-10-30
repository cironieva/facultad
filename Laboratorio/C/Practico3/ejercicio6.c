#include <stdio.h>

int main(void) {
    
    printf("\nEJERCICIO 6\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");


    int x, y, z, m;

    printf("x := ");
    scanf("%d", &x);

    printf("y := ");
    scanf("%d", &y);

    printf("z := ");
    scanf("%d", &z);

    m = 0;

    printf("-----------\n");


    printf("E0: m = %d\n", m);
    
    if (x < y) {
        m = x;
    }
    else {
        m = y;
    }

    printf("E1: m = %d\n", m);
    
    if (m >= z) {
        m = z;
    }
    
    printf("E2: m = %d\n", m);

    return 0;
}