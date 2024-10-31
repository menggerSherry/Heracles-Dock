#include <stdio.h>

__global__ void shfl_down_example(int *data_out) {
    int tid = threadIdx.x;
    int lane = tid % 32;  // 当前线程在 warp 内的索引
    int warpId = tid / 32; // warp 的索引
    int sub_lane = lane % 8;

    // 每个线程的初始值为自己的线程索引
    int value = tid;

    // 使用 __shfl_down_sync 传递值，每个线程向下移动1位的值
    unsigned mask = 0xFFFFFFFF; // 全部线程都激活
    int shuffled = 0;
    shuffled = __shfl_down_sync(mask, value, 4, 8);

    shuffled = (sub_lane / 4 != 0)?  0 : shuffled;

    // 将 shuffle 后的值存入输出数组
    data_out[tid] = shuffled;
}

int main() {
    const int N = 32;  // 一个 warp 的线程数
    int h_data_out[N];

    // 分配 GPU 内存
    int *d_data_out;
    cudaMalloc(&d_data_out, N * sizeof(int));

    // 执行核函数
    shfl_down_example<<<1, N>>>(d_data_out);

    // 将结果从设备复制到主机
    cudaMemcpy(h_data_out, d_data_out, N * sizeof(int), cudaMemcpyDeviceToHost);

    // 打印结果
    printf("Shuffled values (delta=1):\n");
    for (int i = 0; i < N; i++) {
        printf("Thread %2d: %2d\n", i, h_data_out[i]);
    }

    // 释放 GPU 内存
    cudaFree(d_data_out);

    return 0;
}