cmake_minimum_required(VERSION 2.8)
project(foo)

# Set true to see example output
set(6-2 false)
set(6-2-1 false)
set(6-2-2 false)
set(6-2-3 false)
set(6-2-4 false)
set(6-2-5 false)
set(6-2-6 false)
set(6-2-7 false)
set(6-2-8 false)
set(6-2-9 false)
set(6-2-10 false)
set(6-2-11 false)
set(6-2-12 false)
set(6-2-13 false)


#6.2 Cached variable
if(6-2)
      set(abc "687" CAHCE STRING "")
endif()

# 6.2.1- No scope
if(6-2-1)
      #unlike regular variables Cmake cache variables have no scope and are set globally
      set(6-2-1_sub true)
      add_subdirectory(boo)
      message("A: ${A}")

endif()


# 6.2.2- Double set
if(6-2-2)
      #if variable is updaed without remove the cmakecache, the command set(... CACHE ...)
      #has no effect
      set(abc "123" CACHE STRING "")
      message("variable from cache: ${abc}")

      set(abc "789" CACHE STRING "") # does not change variable
      message("variable from cache: ${abc}")

endif()

# 6.2.3- -D
if(6-2-3)
      #cache variables can be ser by -D command line options. Variables set by -D has
      # priority iver set(... CACHE ...) command
      # cmake -Dabc=444 -H. _B_builds


endif()

# 6.2.4-Initial cache
if(6-2-4)
      #if there are lots of variables, users can defined them in a diferent file and then load it with
      # -C "cahce.make"
      # cmake -C initial-cache/cache.cmake -H. -B_builds

      message("A: ${A}")
      message("B: ${B}")
      message("C: ${C}")


endif()


# 6.2.5-Force
if(6-2-5)
      #This is to force change the cache variable, this is not advisable, considered bad code
      # rm -rf build
      # cmake -DA=456 -H. -Bbuilds - commandline has priority of code in CMakeList

      set(A "123" CACHE STRING "" FORCE)
      message("A: ${A}")

endif()




# 6.2.6- Force as a workaround
if(6-2-6)
      # cmake -H. -Bbuilds
      set(A "123")
      set(A "456" CACHE STRING "" FORCE) #global scopr variables have priority
      # over cached variables, forcing it can change that, similar to first unsettng the
      # global variable first


      message("A: ${A}")
endif()





# 6.2.7-Cache Type
if(6-2-7)
      set(FOO_A "YES" CACHE BOOL "Variable A")
      set(FOO_B "boo/info.txt" CACHE FILEPATH "Variable B")
      set(FOO_C "boo/" CACHE PATH "Variable C")
      set(FOO_D "abc" CACHE STRING "Variable D")


      message("FOO_A (bool): ${FOO_A}")
      message("FOO_B (file path): ${FOO_B}")
      message("FOO_C (fir path): ${FOO_C}")
      message("FOO_D (string): ${FOO_D}")
endif()





# 6.2.8- Enumerate
if(6-2-8)
      #selection widget can be created for variables of string type, one variable can
      #a list of values to choose from

      set(FOO_CRYPTO "OpenSSL" CACHE STRING "Backend for cryptography")

      set_property(CACHE FOO_CRYPTO PROPERTY STRINGS "OpenSSL;Libgcrypt;WinCNG")

endif()





# 6.2.9- Internal
if(6-2-9)
      #variables with type internal will not be shown in CMake-GUI(again, real type is a string)
      # internal has the same effect as force

      set(FOO_A "123" CACHE INTERNAL "")
      set(FOO_A "456" CACHE INTERNAL "")
      set(FOO_A "789" CACHE INTERNAL "")

      set(FOO_B "123" CACHE STRING "") # once the variable is cached, it cannot be changed again unless force change is applied
      set(FOO_B "456" CACHE STRING "")
      set(FOO_B "789" CACHE STRING "")

      message("FOO_A (internal): ${FOO_A}")
      message("FOO_B (string): ${FOO_B}")



endif()




# 6.2.10- Mark as advanced
if(6-2-10)

      #if variable is marked as advanced, it will not show in the cmake-gui

      set(FOO_A "123" CACHE STRING "")
      set(FOO_B "456" CACHE STRING "")
      set(FOO_C "789" CACHE STRING "")

      mark_as_advanced(FOO_B)


endif()



# 6.2.11-Use case
if(6-2-11)

      # user can set the variable in the command-line
      # cmake -DFOO_A=User -H . -Bbuild
      set(FOO_A "Default value for A" CACHE STRING "")
      set(FOO_B "Default value for B" )

      message("FOO_A: ${FOO_A}")
      message("FOO_B: ${FOO_B}")


endif()


# 6.2.12- OPTION
if(6-2-12)
      #command option can be used for creating boolean cache entry
      option(FOO_A "Option A" OFF)
      option(FOO_B "Option B" ON)

      message("FOO_A: ${FOO_A}")
      message("FOO_B: ${FOO_B}")

endif()


# 6.2.13- Unset
if(6-2-13)
      #unset(x) does not have any effect on cache, it only removes global variables
      #unset(x CACHE) removes x from cache


      set(X "123" CACHE STRING "X varible")
      set(X "456")
      message("[0] X = ${X}")

      unset(X)
      message("[1] X= ${X}")

      unset(X CACHE)
      message("[2] X = ${X}")

      option(Y "Y option" ON)
      set(Y OFF)
      message("[0] Y = ${Y}")


      unset(Y)
      message("[1] Y = ${Y}")


      unset(Y CACHE)
      message("[2] Y = ${Y}")

endif()

# Recommendation
# Due to the global nature of cache variables and options(cache too), you should
#prefix the cahced variables with the name of the project to avoid clashin in case several
#project are mixed together by add_subdirectory

##Top level CMakeList.txt

#cmake_minimum_required(VERSION 2.8)
#project(zoo)
#add_subdirectory(boo)
#add_subdirectory(foo)


##foo/CMakeLists.txt

#cmake_minimum_required(VERSION 2.8)
#project(foo)
#option(FOO_FEATURE_1 "Enable feature 1" OFF)
#option(FOO_FEATURE_2 "Enable feature 2" OFF)


##boo/CMakeLists.txt

#cmake_minimum_required(VERSION 2.8)
#project(boo)
#option(BOO_FEATURE_1 "Enable feature 1" ON)
#option(BOO_FEATURE_2 "Enable feature 2" ON)


#Summary
#use cache to set global Variables
#Cache variables fits perfectly for expressing customized options: default value and respect user's value
#Type of cache variable helps CMAKE-GUI users
#Prefixes should be used to avoid clashing because of the global nature of cache variables
