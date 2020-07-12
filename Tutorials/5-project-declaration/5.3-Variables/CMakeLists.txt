#Since version 3.0, you can add version
cmake_minimum_required(VERSION 3.0)
project(foo)

message("From top level:")
message(" Source (general): ${PROJECT_SOURCE_DIR}")
message(" Source (foo): ${foo_SOURCE_DIR}")

add_subdirectory(boo)
