cmake_minimum_required(VERSION 3.17)
project(CUDA_CMake CUDA)

set(CMAKE_CUDA_STANDARD 14)

# main.cu
add_executable(CUDA_CMake main.cu)

# chapter 1
add_executable(chapt1_vector_addition 01_cuda_intro/01_vector_addition/vector_addition.cu)

# chapter 2
add_executable(chapt2_vector_addition 02_memory_overview/01_vector_addition/vector_addition.cu)
add_executable(chapt2_aos 02_memory_overview/02_aos_soa/aos.cu)
add_executable(chapt2_soa 02_memory_overview/02_aos_soa/soa.cu)

set_target_properties(
        CUDA_CMake
        PROPERTIES
        CUDA_SEPARABLE_COMPILATION ON)