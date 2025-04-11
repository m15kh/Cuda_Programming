#include <iostream>  // Similar to "import" in Python for input/output

// This is a function that will run on the GPU
// __global__ means it's called from CPU but executes on GPU
__global__ void add(int *a, int *b, int *c, int N) {
    int index =  blockInx.x + blockDim.x + threadIdx.x
    if (index < N){
        c[index] = a[index] + b[index]
    }
}

int main() {

}