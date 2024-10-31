#include "cal_anm.h"
#include <cublas_v2.h>
#include <cusolverDn.h>
#include <cuda_runtime.h>
#include "error.cuh"





void eigh_gpu(double * eigenvalues, double * eigenvectors, double * matrix, int * eigvals, int n){


    cusolverDnHandle_t cusolver_handle = NULL;
    // cudaStream_t stream = NULL;
    
    int lda = n;

    double * d_eigenvalues = nullptr;
    double * d_matrix = nullptr;
    double * d_work = nullptr;
    int *d_info = nullptr;

    int info = 0;
    int lwork = 0;
    // double * eigenvalues_buffer = new double [n];
    double * eigenvectors_buffer = (double *)malloc(n*n*sizeof(double));
    // double * eigenvectors_buffer = new double [n*n];
    CUSOLVER_CHECK(cusolverDnCreate(&cusolver_handle));
    // CHECK(cudaStreamCreateWithFlags(&stream, cudaStreamNonBlocking));
    // CUSOLVER_CHECK(cusolverDnSetStream(cusolver_handle, stream));

    CHECK(cudaMalloc((void**)&d_matrix, n * n * sizeof(double)));
    CHECK(cudaMalloc((void**)&d_eigenvalues,n*sizeof(double)));
    CHECK(cudaMalloc((void**)&d_info,sizeof(int)));

    CHECK(cudaMemcpy(d_matrix, matrix, n * n * sizeof(double), cudaMemcpyHostToDevice));

    cusolverEigMode_t jobz = CUSOLVER_EIG_MODE_VECTOR; // compute eigenvalues and eigenvectors.
    cublasFillMode_t uplo = CUBLAS_FILL_MODE_LOWER;

    CUSOLVER_CHECK(cusolverDnDsyevd_bufferSize(cusolver_handle,jobz,uplo,n,d_matrix,lda,d_eigenvalues,&lwork));

    CHECK(cudaMalloc((void**)&d_work,sizeof(double)*lwork));

    // compute spectrum

    CUSOLVER_CHECK(cusolverDnDsyevd(cusolver_handle, jobz, uplo, n, d_matrix, lda, d_eigenvalues, d_work, lwork, d_info));
    // check_cusolver(status);
    // std::printf("after syevd: info = %d\n", info);
    if (0 > info) {
        std::printf("%d-th parameter is wrong \n", -info);
        exit(1);
    }

    int start = eigvals[0];
    int end = eigvals[1];
    int length = end - start + 1;
    CHECK(cudaMemcpy(eigenvectors_buffer, d_matrix, n * n * sizeof(double), cudaMemcpyDeviceToHost));
    CHECK(cudaMemcpy(eigenvalues, d_eigenvalues+start, length*sizeof(double),cudaMemcpyDeviceToHost));
    CHECK(cudaMemcpy(&info, d_info, sizeof(int), cudaMemcpyDeviceToHost));
    
    CHECK(cudaFree(d_matrix));
    CHECK(cudaFree(d_eigenvalues));
    CHECK(cudaFree(d_work));
    CHECK(cudaFree(d_info));
    CUSOLVER_CHECK(cusolverDnDestroy(cusolver_handle));
    cudaDeviceReset();
    // 
    for(int i = 0; i< length; i++){
        for(int j = 0; j< n; j++){
            eigenvectors[j*length+i] = eigenvectors_buffer[i*n+j];
        }
    }

    // delete [] eigenvectors_buffer;
    free(eigenvectors_buffer);
    

}





