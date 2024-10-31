cmake_minimum_required(VERSION 3.7)


project(lightdock)





set(LIB_PRE "pre")
set(LIB_JSON "json")
set(LIB_SASA "freesasa")
set(LIB_DOCK "dock")
set(CMAKE_VERBOSE_MAKEFILE ON)
# message(STATUS "eigin" ${EIGEN3_INCLUDE_DIRS})

# find_package(Eigen3 REQUIRED)
# find threads
find_package(Threads)
find_package(OpenMP REQUIRED)

add_subdirectory(prep)
add_subdirectory(simulation)
add_subdirectory(json)
add_subdirectory(freesasa)
add_subdirectory(dock)