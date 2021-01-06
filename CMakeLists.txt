cmake_minimum_required(VERSION 3.17)
project(CUDA_CMake CUDA)

set(CMAKE_CUDA_STANDARD 14)

add_executable(CUDA_CMake main.cu)
add_executable(vector_addition 01_cuda_intro/01_vector_addition/vector_addition.cu)

set_target_properties(
        CUDA_CMake
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)