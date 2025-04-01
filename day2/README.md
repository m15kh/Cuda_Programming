# CUDA Programming - Day 2

## What I Learned

I learned how to create a correct CUDA project, including:

- Setting up the proper project structure
- Using the NVIDIA compiler (nvcc) for CUDA code
- Managing GPU memory allocation and transfers
- Writing and launching CUDA kernels

## Key Components of a CUDA Project

1. **Project Structure**:
   - Source files with `.cu` extension
   - Header files (`.h` or `.cuh`)
   - Makefile for compilation

2. **Basic CUDA Program Flow**:
   - Allocate memory on host (CPU)
   - Allocate memory on device (GPU) using `cudaMalloc()`
   - Copy data from host to device using `cudaMemcpy()`
   - Launch kernel with `kernel<<<blocks, threads>>>(args)`
   - Copy results back from device to host
   - Free device memory with `cudaFree()`

3. **Compilation**:
   ```bash
   nvcc -o program_name source_file.cu
   ```

4. **Error Handling**:
   - Check CUDA API calls with error handling
   - Use `cudaGetLastError()` and `cudaGetErrorString()` for debugging

## Simple Template

```cuda
// Host code
int main() {
    // Allocate and initialize host data
    
    // Allocate GPU memory
    cudaMalloc((void**)&d_data, size);
    
    // Copy to GPU
    cudaMemcpy(d_data, h_data, size, cudaMemcpyHostToDevice);
    
    // Launch kernel
    myKernel<<<gridDim, blockDim>>>(d_data);
    
    // Copy results back
    cudaMemcpy(h_result, d_data, size, cudaMemcpyDeviceToHost);
    
    // Free GPU memory
    cudaFree(d_data);
    
    return 0;
}

// Device code
__global__ void myKernel(float* data) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Parallel operations here
}
```
