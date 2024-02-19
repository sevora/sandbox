#include <stdio.h>

/** 
 * An implementation of factorial in C++,
 * I don't know why I wrote this but it's here.
 */
unsigned long factorial(unsigned long n) {
    if (n == 1) return 1;
    return n * factorial(n-1);
}

int main() {
    for (unsigned int i = 1; i <= 20; ++i) {
        printf("%d! : %'lu \n", i, factorial(i));
    }
    return 0;
}
