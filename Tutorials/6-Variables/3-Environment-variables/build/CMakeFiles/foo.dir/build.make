# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.13

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables/build

# Utility rule file for foo.

# Include the progress variables for this target.
include CMakeFiles/foo.dir/progress.make

CMakeFiles/foo:
	/usr/bin/cmake -P /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables/script.cmake

foo: CMakeFiles/foo
foo: CMakeFiles/foo.dir/build.make

.PHONY : foo

# Rule to build all files generated by this target.
CMakeFiles/foo.dir/build: foo

.PHONY : CMakeFiles/foo.dir/build

CMakeFiles/foo.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/foo.dir/cmake_clean.cmake
.PHONY : CMakeFiles/foo.dir/clean

CMakeFiles/foo.dir/depend:
	cd /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables/build /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables/build /home/stevedan/Desktop/cmake_course/Tutorials/6-Variables/3-Environment-variables/build/CMakeFiles/foo.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/foo.dir/depend
