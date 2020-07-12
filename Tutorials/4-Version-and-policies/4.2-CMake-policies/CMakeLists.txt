cmake_minimum_required(VERSION 2.8)
project(foo)

add_library(foo foo.cpp)

# old policy allowed user to have target linked to itself which makes no sense
#target_link_libraries(foo foo)  #BAD CODE ! Makes no sense
