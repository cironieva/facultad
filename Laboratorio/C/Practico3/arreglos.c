#include <stdio.h>
#define N 5

int main(void) {

    int a[N];
    a[0] = 12;
    a[1] = -9;
    a[2] = 10;
    a[3] = 0;
    a[4] = -1;

    
    int i = 0;
    int p = 0;
    int m = 0;

    while (i < N) {
        if (a[i] > 0) {
            p = p + a[i];
        }
        // if not
        if (a[i] % 3 == 0) {
            m = m + a[i];
        }
        i = i + 1;
    }

    printf("Positivos: %d\n", p);
    printf("Múltiplos: %d\n", m);

    return 0;
}