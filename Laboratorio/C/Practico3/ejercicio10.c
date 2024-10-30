#include <stdio.h>
#include <stdbool.h>

// Inciso 1

int pedir_entero(char name) {
    int n;
    printf("%c = ", name);
    scanf("%d", &n);

    return n;
}

void imprimir_entero(char name, int x) {
    printf ("%c vale %d\n", name, x);
}


// Inciso 2

bool pedir_booleano(char name) {
    int n;
    printf("%c = ", name);
    scanf("%d", &n);

    bool b = n;

    return b;
}

void imprimir_booleano(char name, bool x) {
    if (x) {
        printf ("%c es verdadero\n", name);
    }
    else {
        printf ("%c es falso\n", name);
    }
}


// Inciso 3

int valor_m (int x, int y, int z) {
    int m;

    if (x < y) {
        m = x;
    }
    else {
        m = y;
    }
    
    if (m >= z) {
        m = z;
    }
    
    return m;
}


// Inciso 4

void imprimir_hola(void) {
    printf("hola\n");
}

void imprimir_chau(void) {
    printf("chau\n");
}

int main(void) {

    printf("\nEJERCICIO 10\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯¯\n");
    
    // Inciso 1
    printf("\nInciso 1\n");
    printf("¯¯¯¯¯¯¯¯\n");

    char nombre = 'n';
    imprimir_entero(nombre, pedir_entero(nombre));

    // Inciso 2
    printf("\nInciso 2\n");
    printf("¯¯¯¯¯¯¯¯\n");

    nombre = 'b';
    imprimir_booleano(nombre, pedir_booleano(nombre));

    // Inciso 3 
    printf("\nInciso 3\n");
    printf("¯¯¯¯¯¯¯¯\n");

    int x = pedir_entero('x');
    int y = pedir_entero('y');
    int z = pedir_entero('z');
    int m = valor_m(x, y, z);

    printf("m vale %d\n", m);


    // Inciso 4
    printf("\nInciso 4\n");
    printf("¯¯¯¯¯¯¯¯\n");

    imprimir_hola();
    imprimir_hola();
    imprimir_chau();
    imprimir_chau();

    return 0;
}