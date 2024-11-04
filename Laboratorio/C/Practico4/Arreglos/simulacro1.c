#include <stdio.h>
#include <assert.h>

int pedir_entero(char name) {
    int n;
    printf("%c = ", name);
    scanf("%d", &n);
    return n;
}

typedef struct {
    int op_sum; // Guarda la suma
    int op_mul; // Guarda la multiplicación
    int op_div; // Guarda la división entera
    int op_dist; // Guarda el valor absoluto de la resta
} info_t;

int div_ent(int x, int y) {
    int q = 0;
    while (x >= y) {
        x -= y;
        q ++;
    }
    return q;
}

int val_abs(int x) {
    if (x>=0) return x;
    return -x;
}

info_t operar(int x, int y) {
    info_t res;
    res.op_sum = x + y;
    res.op_mul = x * y;
    res.op_div = div_ent(x, y);
    res.op_dist = val_abs(x - y);

    return res;
}


int main(void) {

    printf("Introduzca dos enteros positivos a y b, siendo a > b\n");

    int a = pedir_entero('a');
    int b = pedir_entero('b');
    
    assert(a > 0 && b > 0 && a > b);

    printf("-----------\n");

    info_t res = operar(a, b);

    printf("%d + %d = %d\n", a, b, res.op_sum);
    printf("%d * %d = %d\n", a, b, res.op_mul);
    printf("%d div %d = %d\n", a, b, res.op_div);
    printf("|%d - %d| = %d\n", a, b, res.op_dist);

    return 0;
}
