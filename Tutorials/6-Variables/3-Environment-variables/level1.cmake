#level1.cmake script 

message("Environment variable from level1: $ENV{ABC}")

set(level2 "${CMAKE_CURRENT_LIST_DIR}/level2.cmake")

execute_process(
    COMMAND "${CMAKE_COMMAND}" -P "${level2}" RESULT_VARIABLE result
)

if(NOT result EQUAL 0)
  # Error
endif()