#include <iostream>

__global__ void print_from_gpu(void) {
    printf("Hello World! from thread [%d, %d] From device\n", threadIdx.x, blockIdx.x);
}

int main() {
    std::cout << "Hello, World! from host!" << std::endl;
    print_from_gpu<<<1,2>>>();
    cudaDeviceSynchronize();
    return 0;
}
