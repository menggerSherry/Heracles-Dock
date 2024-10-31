#include <stdio.h>
#include <cuda.h>

#define ITERATIONS 1

// Kernel function to measure __shfl_sync latency in cycles
__global__ void benchmark_shfl_sync_cycles(unsigned long long *output_cycles) {
    volatile int value = threadIdx.x;
    int laneId = threadIdx.x % 32;

    // Record start clock
    unsigned long long start = clock64();

    
    value = __shfl_sync(0xffffffff, value, laneId, 4);
    

    // Record end clock
    unsigned long long end = clock64();

    // Return the number of cycles
    output_cycles[threadIdx.x] = (end - start);
}

// Kernel function to measure __shfl_down_sync latency in cycles
__global__ void benchmark_shfl_down_sync_cycles(unsigned long long *output_cycles) {
    volatile int value = threadIdx.x;

    // Record start clock
    unsigned long long start = clock64();

    
    value = __shfl_down_sync(0xffffffff, value, 1, 4);
    

    // Record end clock
    unsigned long long end = clock64();

    // Return the number of cycles
    output_cycles[threadIdx.x] = (end - start);
}

// Utility function to print the results
void print_cycles(const char* kernel_name, unsigned long long* h_output) {
    printf("%s cycles per warp:\n", kernel_name);
    for (int i = 0; i < 32; ++i) {
        printf("Thread %d: %llu cycles\n", i, h_output[i]);
    }
    printf("\n");
}

int main() {
    unsigned long long h_output[32];
    unsigned long long *d_output;

    cudaMalloc(&d_output, 32 * sizeof(unsigned long long));

    // Measure cycles for __shfl_sync
    benchmark_shfl_sync_cycles<<<1, 32>>>(d_output);
    cudaMemcpy(h_output, d_output, 32 * sizeof(unsigned long long), cudaMemcpyDeviceToHost);
    print_cycles("__shfl_sync", h_output);

    // Measure cycles for __shfl_down_sync
    benchmark_shfl_down_sync_cycles<<<1, 32>>>(d_output);
    cudaMemcpy(h_output, d_output, 32 * sizeof(unsigned long long), cudaMemcpyDeviceToHost);
    print_cycles("__shfl_down_sync", h_output);

    // Cleanup
    cudaFree(d_output);

    return 0;
}
