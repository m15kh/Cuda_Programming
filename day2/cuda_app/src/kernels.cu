#include <stdio.h>
#include "kernels.h"

__global__ void dummykernel(){
    printf("Block %d, Thread %d\n", blockIdx.x, threadIdx.x);
}