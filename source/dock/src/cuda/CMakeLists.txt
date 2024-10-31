# required cmake version
cmake_minimum_required(VERSION 3.3)
# project name
project(light_dock_cuda)

# SET(CUDA_SEPARABLE_COMPILATION ON)
find_package(CUDA REQUIRED)
if (NOT CUDA_FOUND)
    message(STATUS "CUDA not found. Project will not be built.")
endif(NOT CUDA_FOUND)

find_package(OpenMP REQUIRED)
# set c++ version c++11
SET(CMAKE_CXX_STANDARD 17)
SET(CMAKE_CUDA_STANDARD 17)


message(STATUS "CUDA major version is " ${CUDA_VERSION_MAJOR})

if (${CUDA_VERSION_MAJOR} GREATER "11")
    # nvcc flags
    message(STATUS "use greater 11")
    set(CUDA_NVCC_FLAGS  -O2 -g -arch=sm_80;
                        --expt-relaxed-constexpr;
                        -cudart shared;
                        -Xcompiler -fPIC;
                        -Xcompiler -fopenmp;
        )
elseif (${CUDA_VERSION_MAJOR} STREQUAL "11" AND ${CUDA_VERSION_MINOR} GREATER "0")
    # nvcc flags
    set(CUDA_NVCC_FLAGS  -O2 -g -arch=sm_80;
                        --expt-relaxed-constexpr;
                        -cudart shared
                    -Xcompiler -fPIC ;
                    -Xcompiler -fopenmp;
        )
elseif (${CUDA_VERSION_MAJOR} STREQUAL "11" AND ${CUDA_VERSION_MINOR} STREQUAL "0")
    # nvcc flags
    set(CUDA_NVCC_FLAGS -O2 -g -arch=sm_80;
                        --expt-relaxed-constexpr;
                        -cudart shared
                        -Xcompiler -fPIC ;
                        -Xcompiler -fopenmp;
        )
elseif (${CUDA_VERSION_MAJOR} STREQUAL "10")
    set(CUDA_NVCC_FLAGS -gencode arch=compute_75,code=sm_75; # Turing - RTX 2080, Titan RTX, Quadro R8000
                        -Xcompiler -fPIC ;
                        -Xcompiler -fopenmp;
        )
else () 
    message(FATAL_ERROR "unsupported CUDA_VERSION " ${CUDA_VERSION} ", please use a newer version (>=7.0) of CUDA toolkit!")
endif()



set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++17 -DCUB_IGNORE_DEPRECATED_CPP_DIALECT -DCUB_IGNORE_DEPRECATED_CPP_DIALECT -fopenmp")

# if (${CUDA_VERSION_MAJOR} LESS_EQUAL "11")
# 	# check unsupported -std=c++17
# 	set(CMAKE_CXX_FLAGS_LIST "${CMAKE_CXX_FLAGS}")
# 	separate_arguments(CMAKE_CXX_FLAGS_LIST)
# 	if ("-std=c++17" IN_LIST CMAKE_CXX_FLAGS_LIST)
# 		message(WARNING "Environment variable CXXFLAGS contains flag --std=c++17 which is unsupported by CUDA ${CUDA_VERSION}. Such flag will be removed automatically.")
# 		string(REPLACE "-std=c++17" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
# 	endif()
# endif()


file (GLOB SOURCE_FILES "*.cu" )
# message(STATUS ${CUDA_LIBRARIES})
set(CMAKE_CUDA_FLAGS "${CMAKE_CUDA_FLAGS} -std=c++17 -I3rd/cutlass/include --expt-relaxed-constexpr -cudart shared --cudadevrt none -lcublasLt -lcublas -Xcompiler -fopenmp")
# add_definitions("")
cuda_add_library(light_dock_cuda SHARED ${SOURCE_FILES})
target_link_directories(light_dock_cuda PUBLIC
            ${CUDA_TOOLKIT_ROOT_DIR}/lib64
            ${CUDA_TOOLKIT_ROOT_DIR}/lib)
target_include_directories(light_dock_cuda PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../../include/  ${CMAKE_CURRENT_SOURCE_DIR}/3rd/cutlass/include/ ${CMAKE_SOURCE_DIR}/prep/include/)
target_link_libraries(light_dock_cuda ${CUDA_LIBRARIES} )

target_link_libraries(light_dock_cuda /share/app/cuda/cuda-11.8/lib64/libcublas.so /share/app/cuda/cuda-11.8/lib64/libcusolver.so )
target_link_libraries(light_dock_cuda OpenMP::OpenMP_CXX)

install(TARGETS light_dock_cuda DESTINATION ${CMAKE_SOURCE_DIR}/../lib/)