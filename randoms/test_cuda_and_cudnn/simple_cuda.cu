#include <iostream>
#include <cuda_runtime.h>

__global__ void kernel() {
    printf("Hello, CUDA!\n");
}

int main() {
    kernel<<<1, 1>>>();
    cudaDeviceSynchronize();
    return 0;
}
