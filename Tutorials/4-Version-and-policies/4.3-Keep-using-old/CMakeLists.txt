cmake_minimum_required(VERSION 2.8)
project(foo)

#It is possible to disable the warning by explicitly requesting the old, or backward compatible behavior using
# the cmake_policy() command
#cmake version 2.8 is not aware of what policy means so it should be protected
# You do not need to protect cmake_policy with if(POLICY) condition because cmake_minimum_required(3.0)
#guarantees us that we are using cmake 3.0+

if(POLICY CMP0038)
    # Policy CMP0038 introduced since CMake 3.0 so fi we want to be compatible
    # with 2.8 (see cmake_minimum_required) we should put 'cmake_policy' under
    # condiction
    #cmake_policy(SET CMP0038 OLD)
endif()

add_library(foo foo.cpp)

# old policy allowed user to have target linked to itself which makes no sense
#target_link_libraries(foo foo)  #BAD CODE ! Makes no sense
