#include <stdio.h>
#include <stdbool.h>

char pedir_letra() {
    char l;
    printf("letra: ");
    scanf("%c", &l);
    return l;
}

bool es_vocal(char letra) {
    bool b = letra == 'a' || letra == 'A' || letra == 'e' || letra == 'E' || letra == 'i' || letra == 'I' || letra == 'o' || letra == 'O' || letra == 'u' || letra == 'U';
    return b;
}

int main(void) {
    
    printf("\nEJERCICIO 2\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    char letra = pedir_letra();

    if (es_vocal(letra)) {
        printf("%c es vocal\n", letra);
    }
    else {
        printf("%c es consonante\n", letra);
    }

    return 0;
}