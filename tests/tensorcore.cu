#include <mma.h>
using namespace nvcuda;

const int WMMA_M = 16;
const int WMMA_N = 16;
const int WMMA_K = 16;

__global__ void wmma_example(half *a, half *b, float *c, 
                             int M, int N, int K, 
                             float alpha, float beta)
{
    int lda = M;
    int ldb = K;
    int ldc = M;
    int warpM = (blockIdx.x * blockDim.x + threadIdx.x) / warpSize;
    int warpN = (blockIdx.y * blockDim.y + threadIdx.y);
    // MMA是warp维度的操作，寄存器分布在warp中的线程中，每一个线程包邮一个片段
    wmma::fragment<wmma::matrix_a, WMMA_M, WMMA_N, WMMA_K, half, wmma::col_major> a_frag;
    wmma::fragment<wmma::matrix_b, WMMA_M, WMMA_N, WMMA_k, half, wmma::col_major> b_frag;

    wmma::fragment<wmma::accumulator, WMMA_M, WMMA_N, WMMA_K,  float> acc_frag;
    wmma::fragment<wmma::accumulator, WMMA_M, WMMA_N, WMMA_K, float> c_frag;
    // a M K ; b K N
    for(int i = 0; i<k; i+=WMMA_K){
        int aRow = warpM * WMMA_M;
        int aCol = i;
        int bRow = i;
        int bCol = warpN * warpN;
        if(aRow < M && aCol < K && bRow<K && bCol < N){
            wmma::load_matrix_sync(a_frag , a+ aRow + aCol * lda, lda);
            wmma::load_matrix_sync(b_frag, b + bRow + bCol * ldb, ldb);
            wmma::mma_sync(acc_frag, a_frag, b_frag, acc_frag);
        }
    }
}


