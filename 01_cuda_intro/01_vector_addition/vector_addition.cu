//
// Created by dveloperY0115 on 1/6/2021.
//

#include <iostream>

#define N 512

/**
 * Takes three arrays of int, performs vector addition and saves the result
 * @param a operand 1
 * @param b operand 2
 * @param c the array where results will be stored in
 */
void host_add(const int* a, const int* b, int* c) {
    for (int idx = 0; idx < N; idx++)
        c[idx] = a[idx] + b[idx];
}

/**
 * Fills the elements of array with its positional indices
 * @param data array of int
 */
void fill_array(int *data) {
    for (int idx = 0; idx < N; idx++)
        data[idx] = idx;
}

/**
 * Takes three arrays of int, prints the arithmetic relationship (addition) of these
 * @param a array 1
 * @param b array 2
 * @param c array 3 (result)
 */
void print_output(const int* a, const int* b, const int* c) {
    for (int idx = 0; idx < N; idx++)
        std::cout << a[idx] << " + " << b[idx] << " = " << c[idx] << std::endl;
}

int main() {
    int *a, *b, *c;
    int size = N * sizeof(int);

    a = (int*) malloc(size); fill_array(a);
    b = (int*) malloc(size); fill_array(b);
    c = (int*) malloc(size);
    host_add(a, b, c);
    print_output(a, b, c);
    free(a); free(b); free(c);
    return 0;
}