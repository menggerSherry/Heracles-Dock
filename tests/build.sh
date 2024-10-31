# nvcc -arch=sm_80 -lcublas -lcusolver  eigh_test.cu 
# nvcc -arch=sm_80 -lcuda compress.cu -o compress
# nvcc -arch=sm_80 -lcuda shufl_test.cu -o shufl_test
# nvcc -arch=sm_80 -lcuda shufle.cu -o shufl
nvcc -arch=sm_80  shfl_benck.cu -o shfl_bench
# g++ kmeans.cpp kmeans.h kmeansPlusPlus.cpp kmeansPlusPlus.h main.cpp simple_svg.hpp -o exe