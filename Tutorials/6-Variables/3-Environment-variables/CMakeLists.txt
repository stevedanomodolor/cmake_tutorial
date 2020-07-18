cmake_minimum_required(VERSION 2.8)
project(foo)

# Set true to see example output
set(6-3-1 false)
set(6-3-2 false)
set(6-3-3 false)
set(6-3-4 false)
set(6-3-5 false)
set(6-3-6 true)

# 6.3.1- Read
if(6-3-1)
      #Environment variable can be read by using $ENV{...}
      # Example gets the user name 
      # rm -rf build
      # echo $USERNAME 
      # export USERNAME 
      # cmake -Hread-env . -Bbuild
      message("Environment variable USERNAME: $ENV{USERNAME}")
endif()


# 6.3.2- set
if(6-3-2)
      # By using set(ENV{...}) syntax CMake can set environment variable
      # rm -rf build
      # echo $USERNAME 
      # export USERNAME 
      # cmake -Hset-env . -Bbuild
      set(ENV{USERNAME} "Stevedan Ogochukwu Omodolor")
      message("Environment variable USERNAME: $ENV{USERNAME}")
endif()

# 6.3.3- unset
if(6-3-3)
      # rm -rf build
      # echo $USERNAME 
      # export USERNAME 
      # cmake -Hunset-env . -Bbuild
      unset(ENV{USERNAME})
      message("Environment variable USERNAME: $ENV{USERNAME}")
endif()

# 6.3.4-Inheriting
if(6-3-4)
      #Child process will inherit environment variable of parent
      # rm -rf build 
      #cmake -Henv-inherit . -Bbuild

      message("Set environment variable")

      set(ENV{ABC} "This is ABC")

      message("Top level ABC: $ENV{ABC}")

      set(level1 "${CMAKE_CURRENT_LIST_DIR}/level1.cmake")

      execute_process(
      COMMAND "${CMAKE_COMMAND}" -P "${level1}" RESULT_VARIABLE result
      )

      if(NOT result EQUAL 0)
      # Error
      endif()

      message("Unset environment variable")

      unset(ENV{ABC})

      message("Top level ABC: $ENV{ABC}")

      execute_process(
      COMMAND "${CMAKE_COMMAND}" -P "${level1}" RESULT_VARIABLE result
      )

      if(NOT result EQUAL 0)
      # Error
      endif()

endif()


# 6.3.5-Configure step
if(6-3-5)
      # rm -rf build 
      #cmake -Henv-configure . -Bbuild
      # cmake --build _builds
      #Note that in previous examples variable was set on configure step:
      # But environment variable remains the same on build step:
      set(ENV{ABC} "123")

      message("Environment variable ABC: $ENV{ABC}")

      add_custom_target(
            foo 
            ALL 
            "${CMAKE_COMMAND}" -P "${CMAKE_CURRENT_LIST_DIR}/script.cmake"
      )
endif()




# 6.3.6- No tracking
if(6-3-6)
      #CMake doesn’t track changes of used environment variables so if your
      #CMake code depends on environment variable and you’re planning to change
      #it from time to time it will break normal workflow:
      #rm -rf _builds
      #export ABC=abc
      #cmake -Henv-depends -B_builds
      # cmake --build _builds
      set(target_name "$ENV{ABC}-tgt")
      add_executable("${target_name}" foo.cpp)
endif()

