#include <stdio.h>
#include <stdbool.h>

bool es_primo (int n) {

    if (n < 2) return false; // por definición

    int i = 2;
    bool primalidad = true;

    while (primalidad && i < n) {
        primalidad = n % i != 0;
        i ++;
    }

    return primalidad;
}

int n_esimo_primo(int n) {
    int count = 0;              // debe iniciar en 0
    int num = 1;                // acá podría ir cualquier num < 2
    while (count < n) {
        num++;                  // Es importante que esto esté primero
        if (es_primo(num)) {    // y esto segundo
            count++;
        }
    }
    return num;

    // num es un número primo
    // count es el ordinal de ese número
}

int main(void) {
    int n;
    printf("Ingrese un número > 0: ");
    scanf("%d", &n);
    printf("el primo nro %d es: %d\n", n, n_esimo_primo(n));
}



// copilot

// > EXPLICAME LA FUNCION N_ESIMO_PRIMO. ¿CÓMO Y POR QUÉ FUNCIONA?

// La función n_esimo_primo tiene como objetivo encontrar y retornar el n-ésimo número primo. Aquí tienes una explicación detallada de cómo funciona y por qué funciona:

// Funcionamiento de n_esimo_primo
// Inicialización de Variables:

// count se inicializa en 0 y se utiliza para contar cuántos números primos se han encontrado.
// num se inicializa en 1 y se utiliza para probar números consecutivos para ver si son primos.
// Bucle Principal:

// La función entra en un bucle while que continúa hasta que count sea igual a n.
// Dentro del bucle, num se incrementa en 1 en cada iteración para probar el siguiente número.
// Verificación de Primalidad:

// Para cada valor de num, se llama a la función es_primo para verificar si num es un número primo.
// Si num es primo, count se incrementa en 1.
// Retorno del Resultado:

// Cuando count alcanza el valor de n, el bucle se detiene y la función retorna el valor de num, que es el n-ésimo número primo.
// Por qué Funciona
// La función n_esimo_primo funciona porque sigue un enfoque sistemático para encontrar números primos:

// Incremento Secuencial:

// La función prueba cada número entero consecutivo a partir de 2 (ya que 1 no es primo) para ver si es primo.
// Uso de es_primo:

// La función es_primo verifica si un número es primo. Si es_primo(num) retorna true, entonces num es primo y se incrementa count.
// Contador de Primos:

// La función mantiene un contador count que se incrementa cada vez que se encuentra un número primo. Esto asegura que la función sigue buscando hasta encontrar exactamente n números primos.
// Terminación del Bucle:

// El bucle while se detiene cuando count alcanza n, garantizando que el valor de num en ese momento es el n-ésimo número primo.
// Ejemplo de Ejecución
// Supongamos que n es 5. La función buscará el 5º número primo:

// num empieza en 1.
// Incrementa num a 2. es_primo(2) retorna true, así que count se incrementa a 1.
// Incrementa num a 3. es_primo(3) retorna true, así que count se incrementa a 2.
// Incrementa num a 4. es_primo(4) retorna false, así que count no cambia.
// Incrementa num a 5. es_primo(5) retorna true, así que count se incrementa a 3.
// Incrementa num a 6. es_primo(6) retorna false, así que count no cambia.
// Incrementa num a 7. es_primo(7) retorna true, así que count se incrementa a 4.
// Incrementa num a 8. es_primo(8) retorna false, así que count no cambia.
// Incrementa num a 9. es_primo(9) retorna false, así que count no cambia.
// Incrementa num a 10. es_primo(10) retorna false, así que count no cambia.
// Incrementa num a 11. es_primo(11) retorna true, así que count se incrementa a 5.
// En este punto, count es igual a n (5), así que el bucle se detiene y la función retorna num, que es 11. Por lo tanto, el 5º número primo es 11.

// > ¿POR QUÉ NUM ESTÁ INICIALIZADA EN 1?

// La variable num está inicializada en 1 en la función n_esimo_primo porque queremos empezar a buscar números primos desde el número 2 en adelante. Aquí está el razonamiento:

// Razonamiento
// Inicio de la Búsqueda:

// Los números primos son números naturales mayores que 1 que solo son divisibles por 1 y por sí mismos.
// El primer número primo es 2.
// Incremento Inicial:

// Inicializando num en 1 y luego incrementándolo inmediatamente (num++), el primer número que se verifica es 2.
// Esto asegura que la búsqueda de números primos comienza correctamente desde el primer número primo.
// Ejecución Paso a Paso
// Inicialización:

// count se inicializa en 0 para contar cuántos números primos se han encontrado.
// num se inicializa en 1.
// Primer Incremento:

// En la primera iteración del bucle while, num se incrementa a 2 (num++).
// Verificación de Primalidad:

// es_primo(2) se llama y retorna true porque 2 es un número primo.
// count se incrementa a 1.
// Búsqueda Continua:

// El bucle continúa incrementando num y verificando cada número para ver si es primo, incrementando count cada vez que se encuentra un número primo.

// Resumen
// Inicialización en 1: Permite que el primer número verificado sea 2, el primer número primo.
// Incremento y Verificación: num se incrementa y se verifica en cada iteración del bucle while hasta encontrar el n-ésimo número primo.
// Este enfoque asegura que la función n_esimo_primo encuentra y retorna correctamente el n-ésimo número primo.
