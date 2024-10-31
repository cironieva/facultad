#include <stdio.h>

struct div_result {
    int cociente;
    int resto;
};

struct div_result division(int numerador, int divisor) {
        
    int cociente = 0;
    int resto = numerador;
        
    while (resto >= divisor) {
        resto -= divisor;
        cociente ++;
    }

    struct div_result resultado = {cociente, resto};
        
    
    return resultado;
}

int main(void) {

    // Creo una estructura llamada 'par'
    
    struct par {
        int fst;
        int snd;
    };
    
    // Utilizo esa estructura para crear una variable llamada 'dupla'

    struct par dupla;

    // Le asigno valores a esa variable que creé

    dupla.fst = 1;
    dupla.snd = 2;

    // Imprimo los valores de la variable 'dupla'

    printf("(%d, %d)\n", dupla.fst, dupla.snd);


    // Typedef: Defino una nueva estructura llamada 'rectangulo'

    typedef struct {
        int base;
        int altura;
    } rectangulo;

    // Utilizo la estructura 'rectangulo' para crear una variable llamada 'terreno'

    rectangulo terreno;

    // terreno es una variable de tipo rectangulo

    // Le asigno valores a la variable 'terreno'

    terreno.base = 3;
    terreno.altura = 4;

    // Imprimo los valores de la variable 'terreno'

    printf("su campo tiene %dm de largo y %dm de alto\n", terreno.base, terreno.altura);


    // otra cosa

    struct div_result resultado = division (10, 2);

    printf("cociente = %d, resto = %d\n", resultado.cociente, resultado.resto);
    
    return 0;
}