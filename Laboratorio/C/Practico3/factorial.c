#include <stdio.h>
#define N 5

int main(void) {

    int i = 1;
    int f = 1;

    while (i <= N) {
        f = f * i;
        i = i + 1;
    }
    printf("%d! = %d\n", N, f);

    // ------------------------

    i = N;
    f = N;

    while (i > 2) {
        i = i - 1;
        f = f * i;
    }
    printf("%d! = %d\n", N, f);

    return 0;
}
