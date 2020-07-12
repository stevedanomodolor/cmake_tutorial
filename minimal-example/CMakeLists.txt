#CMakeLists.txt
# cmake -H. -Bbuilds -G "Unix Makefiles"
cmake_minimum_required(VERSION 2.8)
project(foo)

add_executable(foo foo.cpp)