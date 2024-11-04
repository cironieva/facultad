#include <stdio.h>
#include <assert.h>

typedef struct {
    int cociente;
    int resto;
} div_t;

div_t division(int x, int y) {
    int q = 0;
    while (x >= y) {
        x -= y;
        q++;
    }
    div_t res = {q, x};
    return res;
}

int main(void) {
    
    int numerador, denominador;

    printf("Numerador: ");
    scanf("%d", &numerador);
    printf("Denominador (!=0): ");
    scanf("%d", &denominador);

    assert(denominador != 0);

    int q = division(numerador, denominador).cociente;
    int r = division(numerador, denominador).resto;

    printf("%d = %d * %d + %d\n", numerador, denominador, q, r);

    return 0;
}