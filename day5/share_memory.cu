__global__ void simtExample(float *A, float *B, float *C, int N) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    if(idx < N) {
        if(A[idx] > 0) {
            C[idx] = A[idx] + B[idx];
        } else {
            C[idx] = A[idx] - B[idx];
        }
    }
}

int main() {

}