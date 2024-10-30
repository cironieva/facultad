#include <stdio.h>

int main(void) {
    
    printf("\nEJERCICIO 7\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int i;
    int c = 0;

    // Programa 5a)

    printf("\nPrograma 5a\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    printf("E0: i = ");
    scanf("%d", &i);

    while (i != 0) {
        i --;
        c ++;
        printf("E%d: i = %d\n", c, i);
    }
    
    // Programa 5b)

    printf("\nPrograma 5b\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    c = 0;
    printf("E0: i = ");
    scanf("%d", &i);

    while (i != 0) {
        i = 0;
        c ++;
        printf("E%d: i = %d\n", c, i);
    }


    // Programa 5c)

    printf("\nPrograma 5c\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    c = 0;
    printf("E0: i = ");
    scanf("%d", &i);

    while (i < 0) {
        i --;
        c ++;
        printf("E%d: i = %d\n", c, i);
    }
    // este último es un bucle infinito

    return 0;
}