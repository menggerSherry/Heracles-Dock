
#include <cublas_v2.h>
#include <cusolverDn.h>
#include <cuda_runtime.h>
#include "error.cuh"
#include <iostream>




void eigh_gpu(double * eigenvalues, double * eigenvectors, double * matrix, int * eigvals, int n){


    cusolverDnHandle_t cusolver_handle = NULL;
    cudaStream_t stream = NULL;
    
    int lda = n;

    double * d_eigenvalues = nullptr;
    double * d_matrix = nullptr;
    double * d_work = nullptr;
    int *d_info = nullptr;

    int info = 0;
    int lwork = 0;
    // double * eigenvalues_buffer = new double [n];
    double * eigenvectors_buffer = new double [n*n];
    CUSOLVER_CHECK(cusolverDnCreate(&cusolver_handle));
    CHECK(cudaStreamCreateWithFlags(&stream, cudaStreamNonBlocking));
    CUSOLVER_CHECK(cusolverDnSetStream(cusolver_handle, stream));



    CHECK(cudaMalloc((void**)&d_matrix, n * n * sizeof(double)));
    CHECK(cudaMalloc((void**)&d_eigenvalues,n*sizeof(double)));
    CHECK(cudaMalloc((void**)&d_info,sizeof(int)));

    CHECK(cudaMemcpyAsync(d_matrix, matrix, n * n * sizeof(double), cudaMemcpyHostToDevice,stream));

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
    CHECK(cudaMemcpyAsync(eigenvectors_buffer, d_matrix, n * n * sizeof(double), cudaMemcpyDeviceToHost,stream));
    CHECK(cudaMemcpyAsync(eigenvalues, d_eigenvalues+start, length*sizeof(double),cudaMemcpyDeviceToHost,stream));
    CHECK(cudaMemcpyAsync(&info, d_info, sizeof(int), cudaMemcpyDeviceToHost, stream));
    CHECK(cudaStreamSynchronize(stream));
    CUSOLVER_CHECK(cusolverDnDestroy(cusolver_handle));
    CHECK(cudaFree(d_matrix));
    CHECK(cudaFree(d_eigenvalues));
    CHECK(cudaFree(d_work));

    // 

    for(int i = 0; i< length; i++){
        for(int j = 0; j< n; j++){
            eigenvectors[j*length+i] = eigenvectors_buffer[i*n+j];
        }
    }
    
    // for(int i = 0;i<n;i++){
    //     int index = 0;
    //     for(int j = start; j<=end; j++){
    //         eigenvectors[i*length+index] = eigenvectors_buffer[i*n+j];
    //         index++;
    //     }
    // }
    delete [] eigenvectors_buffer;

}

void build_hessian1D(double *hessian, double *kirchhoff, double cutoff, double gamma, int n_atoms, double *coords){
    double cutoff2 = cutoff * cutoff;
    int dof = n_atoms * 3;

    for (int i = 0; i < n_atoms; i++) {
        int res_i3 = i * 3;
        int i_p1 = i + 1;
        double *coord_i = &coords[i * 3];

        for (int j = i_p1; j < n_atoms; j++) {
            int res_j3 = j * 3;

            double i2j_all[3] = {
                coords[j * 3] - coord_i[0],
                coords[j * 3 + 1] - coord_i[1],
                coords[j * 3 + 2] - coord_i[2]
            };

            double dist2 = 0.0;
            for (int k = 0; k < 3; k++) {
                dist2 += i2j_all[k] * i2j_all[k];
            }

            if (dist2 > cutoff2) {
                continue;
            }

            double g = gamma;

            double super_element[3][3];
            for (int k = 0; k < 3; k++) {
                for (int l = 0; l < 3; l++) {
                    super_element[k][l] = i2j_all[k] * i2j_all[l] * (-g / dist2);
                }
            }

            for (int k = 0; k < 3; k++) {
                for (int l = 0; l < 3; l++) {
                    // 压缩 Hessian 矩阵为一维数组
                    hessian[(res_i3 + k) * dof + (res_j3 + l)] = super_element[k][l];
                    hessian[(res_j3 + l) * dof + (res_i3 + k)] = super_element[k][l];
                    hessian[(res_i3 + k) * dof + (res_i3 + l)] -= super_element[k][l];
                    hessian[(res_j3 + l) * dof + (res_j3 + k)] -= super_element[k][l];
                }
            }

            kirchhoff[i * n_atoms + j] = -g;
            kirchhoff[j * n_atoms + i] = -g;
            kirchhoff[i * n_atoms + i] += g;
            kirchhoff[j * n_atoms + j] += g;
        }
    }
}


int main(){
    double A[9] = {4,2,1,2,5,3,1,3,6};
    double * val = (double *)malloc(3*sizeof(double));
    double * ei_vec = (double *)malloc(3*2*sizeof(double));
    int eival[2] = {0,1};
    eigh_gpu(val,ei_vec,A,eival,3);
    for(int i = 0; i<3;i++){
        for(int j = 0; j<2;j++){
            std::cout<<ei_vec[i*2+j]<<" ";
        }
        std::cout<<std::endl;
    }

    double coord[9] = {
        3,3,4,
        4.5,4.5,3.3,
        6.5,4.4,5.4,
    };
    double * hession = new double[9*9];
    double * kirchhoff = new double[3*3];

    build_hessian1D(hession,kirchhoff,15,1,3,coord);
    for(int i = 0; i<9;i++){
        for(int j = 0; j<9;j++){
            std::cout<<hession[i*9+j]<<" ";
        }
        std::cout<<std::endl;
    }

    return 0;
}



