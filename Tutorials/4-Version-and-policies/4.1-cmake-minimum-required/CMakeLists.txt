#project(foo) #Bad code! You should check version first!
cmake_minimum_required(VERSION 2.8)

#if(NOT CMAKE_VERSION VERSION_ESS "3.0") #means 'not version <'3.0', i.e. ' version >= 3.0'
    #code with 3.0 features
#endif()

project(foo)
add_executable(foo foo.cpp)


# for version 3.0
#cmake_minimum_required(VERSION 3.0)
#project(foo)
#message("Using CMake Version ${CMAKE_VERSION}")
