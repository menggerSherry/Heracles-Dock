#include <stdio.h>
#include <cuda_runtime.h>

// CUDA 内核函数，用于矩阵转置
__global__ void matrixTranspose(float* input, float* output) {
    int tid = threadIdx.x; // 获取当前线程 ID
    int row = tid / 4;     // 计算行号 (0~7)
    int col = tid % 4;     // 计算列号 (0~3)

    // 每个线程读取一个输入矩阵中的元素
    float value = input[row * 4 + col];

    // 通过 shfl 操作在线程间传递数据，实现矩阵转置

    value = __shfl_down_sync(0xFFFFFFFF, value, 7,16);
    value = __shfl_up_sync(0xFFFFFFFF, value, 4,16);
    value = __shfl_up_sync(0xFFFFFFFF, value, 8,16);
    value = __shfl_up_sync(0xFFFFFFFF, value, 2,4);
    
    value = __shfl_down_sync(0xFFFFFFFF, value, 14,32);
    value = __shfl_up_sync(0xFFFFFFFF, value, 4,8);
    value = __shfl_up_sync(0xFFFFFFFF, value, 8,16);
    value = __shfl_up_sync(0xFFFFFFFF, value, 16,32);


    // 写入转置后的矩阵到输出
    output[row * 4 + col] = value;
}

// 检查 CUDA 错误的辅助函数
void checkCudaError(cudaError_t error, const char* msg) {
    if (error != cudaSuccess) {
        printf("%s: %s\n", msg, cudaGetErrorString(error));
        exit(EXIT_FAILURE);
    }
}

// 打印矩阵
void printMatrix(const float* matrix, int rows, int cols) {
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            printf("%5.2f ", matrix[i * cols + j]);
        }
        printf("\n");
    }
}

int main() {
    const int rows = 8;
    const int cols = 4;
    const int matrixSize = rows * cols * sizeof(float);
    
    // 定义并初始化主机端的输入矩阵
    float h_input[rows * cols];
    float h_output[rows * cols];

    // 初始化矩阵数据
    printf("Input Matrix:\n");
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            h_input[i * cols + j] = i * cols + j + 1; // 举例: 1, 2, 3, ..., 32
        }
    }
    printMatrix(h_input, rows, cols);

    // 定义设备端的输入输出矩阵
    float* d_input;
    float* d_output;

    // 分配设备端内存
    checkCudaError(cudaMalloc(&d_input, matrixSize), "Failed to allocate device memory for input");
    checkCudaError(cudaMalloc(&d_output, matrixSize), "Failed to allocate device memory for output");

    // 将输入矩阵从主机复制到设备
    checkCudaError(cudaMemcpy(d_input, h_input, matrixSize, cudaMemcpyHostToDevice), "Failed to copy input matrix to device");

    // 启动 kernel，假设一个 warp 32 个线程，每个线程一个 value
    matrixTranspose<<<1, 32>>>(d_input, d_output);

    // 等待 GPU 完成
    checkCudaError(cudaDeviceSynchronize(), "Kernel execution failed");

    // 将结果从设备端复制回主机
    checkCudaError(cudaMemcpy(h_output, d_output, matrixSize, cudaMemcpyDeviceToHost), "Failed to copy output matrix to host");

    // 打印转置后的矩阵
    printf("Transposed Matrix:\n");
    printMatrix(h_output, rows, cols); // 打印转置矩阵

    // 释放设备内存
    cudaFree(d_input);
    cudaFree(d_output);

    return 0;
}
