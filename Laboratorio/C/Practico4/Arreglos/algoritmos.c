#include <stdio.h>
#define N 3

int max(int a, int b) {
    return (a > b) ? a : b;
}

int mio (int A[]) {
    
    int r, n, u;

    // {S1}
    r = 0;
    n = 0;
    u = 0;
    
    int auxU;

    while (n != N) {

        // {S2}

        auxU = u;

        u = max (A[n] + u, 0);
        r = max (r, auxU);
        n = n + 1;

    }
    
    return r;

}

int libro (int A[]) {
    
    int r, n, u;

    // {S1}
    r = 0;
    n = 0;
    u = 0;
    
    while (n != N) {

        // {S2'};
        u = max (A[n] + u, 0);

        // {S2}
        r = max (r, u);
        n = n + 1;

    }
    
    return r;

}

int main(void) {

    int A[N];
    
    A[0] = -2;
    A[1] = 23;
    A[2] = 7;


    int simple = mio (A);
    int cdp = libro (A);

    printf("Mi solución = %d\n", simple);
    printf("Del libro = %d\n", cdp);


    return 0;
}