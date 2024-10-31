#include <stdio.h>
#include <assert.h>

struct div_t  {
    int cociente;
    int resto;
};

struct div_t division (int x, int y) {

    int q = 0;

    while (x >= y) {
        x -= y;
        q ++;
    }
    
    struct div_t resultado = {q, x};

    return resultado;
}

int main(void) {

    printf("\nEJERCICIO 9\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int numerador, denominador;

    printf("Numerador = ");
    scanf("%d", &numerador);

    printf("Denominador (!=0) = ");
    scanf("%d", &denominador);

    assert(denominador != 0);

    struct div_t resultado = division(numerador, denominador);

    printf("---------------------\n");
    printf("Cociente = %d, Resto = %d\n", resultado.cociente, resultado.resto);

    return 0;
}