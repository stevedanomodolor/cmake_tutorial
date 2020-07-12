#Since version 3.0, you can add version
# CMake will implicitly declare project in case there is no such command in top-level CMakeList.txt

message("Before 'cmake_minimum_required'")
cmake_minimum_required(VERSION 3.0)

add_subdirectory(boo)
