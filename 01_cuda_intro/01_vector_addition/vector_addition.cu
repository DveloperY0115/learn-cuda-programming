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

__global__ void device_add(int *a, int *b, int *c) {
    int index = threadIdx.x + blockIdx.x * blockDim.x;
    c[index] = a[index] + b[index];
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
    int *d_a, *d_b, *d_c;   // device copies of a, b, c
    int size = N * sizeof(int);

    // allocate memory on host
    a = (int*) malloc(size); fill_array(a);
    b = (int*) malloc(size); fill_array(b);
    c = (int*) malloc(size);

    // allocate memory on device
    cudaMalloc((void **) &d_a, N * sizeof(int));
    cudaMalloc((void **) &d_b, N * sizeof(int));
    cudaMalloc((void **) &d_c, N * sizeof(int));

    // copy host -> device
    cudaMemcpy(d_a, a, N * sizeof(int), cudaMemcpyHostToDevice);
    cudaMemcpy(d_b, b, N * sizeof(int), cudaMemcpyHostToDevice);

    // perform addition on device
    size_t threads_per_block = 8;
    size_t no_of_blocks = N / threads_per_block;
    device_add<<< no_of_blocks, threads_per_block >>>(d_a, d_b, d_c);

    // copy host <- device
    cudaMemcpy(c, d_c, N * sizeof(int), cudaMemcpyDeviceToHost);

    cudaDeviceSynchronize();

    print_output(a, b, c);

    // free host memory
    free(a); free(b); free(c);

    // free device memory
    cudaFree(d_a); cudaFree(d_b); cudaFree(d_c);

    return 0;
}