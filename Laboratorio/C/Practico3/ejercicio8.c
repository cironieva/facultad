#include <stdio.h>

int main(void) {
    
    printf("\nEJERCICIO 8\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int x, y, i, c, res;

    // Programa 8a)

    printf("\nPrograma 5a\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("Asignaciones:\n");
    printf("x = ");
    scanf("%d", &x);
    printf("y = ");
    scanf("%d", &y);
    printf("i = ");
    scanf("%d", &i);
    printf("-----------------------\n");

    c = 0;
    i = 0;
    printf("E%d: x = %d, y = %d, i = %d\n", c, x, y, i);

    while (x >= i) {
        x -= y;
        i ++;
        c ++;
        printf("E%d: x = %d, y = %d, i = %d\n", c, x, y, i);
    }
    
    // Programa 5b)

    printf("\nPrograma 5b\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("Asignaciones:\n");
    printf("x = ");
    scanf("%d", &x);
    printf("i = ");
    scanf("%d", &i);
    printf("1:true; 0:false\n");
    printf("res = ");
    scanf("%d", &res);
    printf("-----------------------\n");

    c = 0;
    printf("E%d: x = %d, res = %d, i = %d\n", c, x, res, i);

    i = 2;
    res = 1;

    while (i < x && res) {
        res = res && (x % i != 0);
        i ++;
        c ++;
        printf("E%d: x = %d, res = %d, i = %d\n", c, x, res, i);
    }

    return 0;
}