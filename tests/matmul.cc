#include <iostream>
static void print_mat(double * mat, int row, int col){
    for(int i = 0; i<row; i++){
        for (int j = 0; j<col; j++){
            std::cout<<mat[i*col+j]<<"  ";
        }
        std::cout<<std::endl;
    }
}

void multiplyDiagonalMatrix(int k, int n, double *A, double *B, double * C) {
    // A diag B: k*n
    for(int i = 0; i< k;i++){
        for(int j = 0; j<n; j++){
            double a_value = A[j];
            C[i*n+j] = B[i*n+j] * a_value;
        }
    } 
    
}

void multiplyMatrices(int m, int n, int p, double *A, double *B, double *C) {
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < p; j++) {
            double sum = 0.0;
            for (int k = 0; k < n; k++) {
                sum += A[i * n + k] * B[j*n+k];
            }
            C[i*p+j] = sum;
        }
    }
}



int main(){
    double a[4*3] = {1,2,3,4,5,6,7,8,9,10,11,12};
    double b [4] = {3.4,3.4,3.4,3.4};
    double at[4*3];
    for(int i = 0; i<4; i++){
        for(int j = 0; j<3; j++){
            at[j*4+i] = a[i*3+j];
        }
    }
    double ind[4*3];
    multiplyDiagonalMatrix(3,4,b,at,ind);
    double r[3*3];
    multiplyMatrices(3,4,3,at,ind,r);
    print_mat(r,3,3);
    return 0;
}

