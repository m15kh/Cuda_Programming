// filepath: src/main.cu
#include <cuda_runtime.h>
#include <iostream>

__global__ void dummykernel();

int main() {
    dummykernel<<<2, 4>>>();
    cudaDeviceSynchronize();
    return 0;
}