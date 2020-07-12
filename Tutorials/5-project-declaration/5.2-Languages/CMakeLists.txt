cmake_minimum_required(VERSION 2.8)
#Checking for compilers available

# Place all checks after declaring the project name
message("Before 'project':")
message(" C: '${CMAKE_C_COMPILER}'")
MESSAGE(" C++: '${CMAKE_CXX_COMPILER}'")

project(FOO CXX)


message("After 'project':")
message(" C: '${CMAKE_C_COMPILER}'")
MESSAGE(" C++: '${CMAKE_CXX_COMPILER}'")

add_library(foo foo.cpp)
