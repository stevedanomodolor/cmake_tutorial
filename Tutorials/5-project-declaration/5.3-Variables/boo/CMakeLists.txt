#Since version 3.0, you can add version
cmake_minimum_required(VERSION 3.0)
project(boo)

message("From subdirectory level:")
message(" Source (general): ${PROJECT_SOURCE_DIR}")
message(" Source (foo): ${foo_SOURCE_DIR}")
message(" Source (boo): ${boo_SOURCE_DIR}")
