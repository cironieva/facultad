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
    int count = 0;
    int num = 1;
    while (count < n) {
        num ++;
        if (es_primo(num)) count ++;
    }
    return num;
}


int main(void) {
    
    printf("\nEJERCICIO 16\n");
    printf("¯¯¯¯¯¯¯¯¯¯¯\n");

    int n;
    printf("Se calculará el n-ésimo primo\n");
    
    while (n <= 0) {
        printf("Ingrese un número > 0: ");
        scanf("%d", &n);
    }
    
    printf("----------------------\n");
    printf("El primo nro %d es: %d\n", n, n_esimo_primo(n));

    return 0;
}