#include <iostream>

__global__ void helloFromGPU() {
    int threadId = threadIdx.x + blockIdx.x * blockDim.x;
    printf("Hello, World from GPU! Thread ID: %d\n", threadId);
}

int main() {
    // Launch the kernel
    helloFromGPU<<<3, 5>>>();
    
    // Wait for GPU to finish before accessing results

    cudaDeviceSynchronize(); // ensures that the CPU waits for the GPU to finish executing all previously launched kernels 

    
    
    return 0;
}