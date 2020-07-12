cmake_minimum_required(VERSION 2.8)
project(foo)

# Set true to see example output
set(6-1-1 false)
set(6-1-2 false)
set(6-1-3 false)
set(6-1-4 false)
set(6-1-5 false)
set(6-1-6 false)
set(6-1-7 false)
set(6-1-8 false)
set(6-1-9 false)
set(6-1-10 false)
set(6-1-11 false)
set(6-1-12 false)
set(6-1-13 false)
set(6-1-14 false)
set(6-1-15 false)
set(6-1-16 false)


# 6.1.1-Regular vs Cache
if(6-1-1)
      #The regular variable is created from scratch everytime while the
      # the cache variable is only created once and used the second time
      #it is ran
      #It is possible to cache variables in the CMakeCache.txt
      message("Regular variable(before): ${abc}")
      message("Cached variable(before): ${xyz}")

      set(abc "123")
      set(xyz "321" CACHE STRING "")

      message("Regular variable(After): ${abc}")
      message("Cached variable(After): ${xyz}")
endif()


# 6.1.2-scope of variable
if(6-1-2)
      set(6-1-2_sub true)
      # Each varibles are lined to the the scoped they are defined
      # The commands add_subdirectory and function introduces thier own scope
      set(abc "123")
      message("Top level scope (before): ${abc}")

      add_subdirectory(boo)

      message("Top level scope (After): ${abc}")


endif()

# 6.1.3-New scope
if(6-1-3)
      #When a scope is created it will be initialized with the variable of the parent scope.
      #Command unset can remove the variable from the current scope. if a variable is not found in the
      # scope it will be dereference to an empty string

      function(foo)
            message("[foo]: Scope for function 'foo' copied from parent 'boo': {abc = '${abc}', xyz = '${xyz}'}")
            unset(abc) # remove variable from scope and set to empty string
            message("[foo]: Command 'unset(abc)' will remove variable from current scope: {abc = '${abc}', xyz = '${xyz}'} ")
      endfunction()

      function(boo)
            message("[boo]: Scope for function 'boo' copied from parent: {abc = '${abc}', xyz = '${xyz}'}")
            set(abc "789")
            message("[boo]: Command 'set(abc ...)' will modify from current scope, state: {abc = '${abc}', xyz = '${xyz}'} ")
            foo() # is a child scope foo while bool is child scope to the global scope
      endfunction()

      set(abc "123")
      set(xyz "456")

      message("Top level scope state: {abc = '${abc}', xyz = '${xyz}'}")
      boo()
      # changes in local scope does not affect the global scope
      message("Top level scope state: {abc = '${abc}', xyz = '${xyz}'}")

endif()

# 6.1.4-Same scope
if(6-1-4)
      #set(6-1-4_sub true)
      #include and macro do not introduce a new scope, so commands like set and unset will affect the current scope

      set(abc "123")

      message("abc (before): ${abc}")
      include("./modify-abc.cmake") # modify the value in the inlcude will modify the value in the global scope
      #because it still in the same scope, same goes for the macro
      message("abc (after): ${abc}")

      macro(modify_xyz)
            set(xyz "789")
      endmacro()

      set(xyz "336")

      message("xyz (before): ${xyz}")
      modify_xyz()
      message("xyz (after): ${xyz}")

endif()


# 6.1.5-Parent scope
if(6-1-5)
      #a variable can be set tpo the parent scope with PARENT_SCOPE

      set(abc "")

      function(scope_2)
            message("Scope 2 (before): '${abc}'")
            set(abc "786" PARENT_SCOPE)
            message("Scope 2 (after): '${abc}'")
      endfunction()

      function(scope_1)
            message("Scope 1 (before): '${abc}'")
            scope_2()
            message("Scope 1 (after): '${abc}'")
      endfunction()

      message("Top level scope state: {abc = '${abc}'}")
      scope_1()
      message("Top level scope state: {abc = '${abc}'}")


endif()




# 6.1.6-From cache
if(6-1-6)
      #if a varible is not found in current scope, it is taken from cache
      set(a "789" CACHE STRING "")
      set(a "123")

      message("Regular variable from current scope: ${a}")

      unset(a)

      message("Cache variable if regular not found: ${a}")

endif()





# 6.1.7-Cache unset regular
if(6-1-7)
      #The order of commands is important because setting set(... CACHE ...) after
      #setting regular variable will remove the same name from current scope
      set(a "123")
      set(a "789" CACHE STRING "")


      message("Regular variable unset, take from cache: ${a}")
endif()





# 6.1.8-Confusing
if(6-1-8)
      function(set_abc_globally)
            message("Function scope before cache modify = ${abc}")
            set(abc "789" CACHE STRING "") # does not affect parent scope because this was defined in a local scope
            # If you attempt to run the code again, since abc has already being cached, it is similar to
            # 6.1.6 case where the cache was set before the set
            message("FUNCTION scope after cache modify = ${abc}")
      endfunction()

      set(abc "123")

      set_abc_globally()

      message("Parent scope is not affected, take variable from current scope, not cache = ${abc}")
endif()





# 6.1.9- Names
if(6-1-9)
      #Variable names are case sensitive

      set(a "123")
      set(b "567")
      set(aBc "333")

      set(A "321")
      set(B "765")
      set(ABc "777")

      message("a: ${a}")
      message("b: ${b}")
      message("aBc: ${aBc}")

      message("A: ${A}")
      message("B: ${B}")
      message("ABc: ${ABc}")

      #variables may consists of nay character
      set("abc" "123")
      set("ab c" "456")
      set("ab?c" "789")
      set("/usr/bin/bash" "987")
      set("C:\\Program Files\\" "654")
      set(" " "321")

      function(print_name varname)
            message("Varibale name: '${varname}', value: '${${varname}}'")
      endfunction()

      print_name("abc")
      print_name("ab c")
      print_name("ab?c")
      print_name("/usr/bin/bash")
      print_name("C:\\Program Files\\")
      print_name(" ")

endif()




# 6.1.10- Quotes
if(6-1-10)
      #; list
      set(a "Quoted argument")
      set(b x-"Unquoted argument")
      set(c x"a;b;c")

      message("a = '${a}'")
      message("b = '${b}'")

      message("c =")
      foreach(x ${c})
            message(" '${x}'")
      endforeach()

endif()



# 6.1.11-Dereferencing
if(6-1-11)

      #variables can be used to create other variables or the values of other variables

      set(a "xyz")

      set(b "${a}_321")
      set(${a}_1 "456")
      set(variable_${a} "${a} + ${b} + 155")

      message("b: '${b}'")
      message("xyz_1: '${xyz_1}'")
      message("variable_xyz: '${variable_xyz}'")
endif()


# 6.1.12- Nested dereferencing
if(6-1-12)
      foreach(lang C CXX)
            message("Compiler for language ${lang}: ${CMAKE_${lang}_COMPILER}")
            foreach(build_type DEBUG RELEASE RELWITHDEBINFO MINSIZEREL)
                  message("Flags for language ${lang} + build type ${build_type}: ${CMAKE_${lang}_FLAGS_${build_type}}")
            endforeach()
      endforeach()
endif()


# 6.1.13- Types of variables
if(6-1-13)
      #variables always have type string but some command like "if" can treat
      #it as boolean, path, target name

      set(condition_a "TRUE")
      set(condition_b "NO")


      set(path_to_this "${CMAKE_CURRENT_SOURCE_DIR}/CMakeLists.txt")

      set(target_name foo)
      add_library("${target_name}" foo.cpp)

      if(condition_a)
            message("condition_a")
      else()
            message("NOT condition_a")
      endif()


      if(condition_b)
            message("condition_b")
      else()
            message("NOT condition_b")
      endif()

      if(EXISTS "${path_to_this}")
            message("File exits: ${path_to_this}")
      else()
            message("File not exists: ${path_to_this}")
      endif()

      if(TARGET "${target_name}")
            message("Target exists: ${target_name}")
      else()
            message("Target not exist")
      endif()

endif()


# 6.1.14-Create list
if(6-1-14)
      # create a list with ";" seperating the variables of the list
      set(10 a b c)
      set(11 a;b;c)
      set(12 "a b" "c")
      set(13 "a;b;c")
      set(14 a "b;c")


      message("10 = 'a' + 'b' + 'c' = '${10}'")
      message("11 = 'a;b;c' = '${11}'")
      message("12 = 'a b' + 'c' = '${12}'")
      message("13 = \"'a;b;c'\" = '${13}'")
      message("14 = 'a' + 'b;c' = '${14}'")

      message("print by message: ${13}")
      message("print by message: " "a" "b" "c")


endif()


# 6.1.15-Operations with list
if(6-1-15)

      #The list command can be used to calculate length of list, get elements by index......

      set(10 "a;b;c")
      set(11 "a" "b;c")
      set(12 "a" "b c")

      list(LENGTH 10 10_len)
      list(LENGTH 11 11_len)
      list(LENGTH 12 12_len)

      message("length of '${10}' (10) = ${10_len}")
      message("length of '${11}' (11) = ${11_len}")
      message("length of '${12}' (12) = ${12_len}")


      list(GET 11 2 11_2)
      message("11[2] = ${11_2}")

      message("Removing first item from 11 list: '${11}'")
      list(REMOVE_AT 11 0)
      message("11 = '${11}'")



endif()


# 6.1.16-Lists with one empty string
if(6-1-16)

      #important to note that adding an empty empty element to an empty list result in an empty list
      function(add_element list_name element_name)
            message("Add '${${element_name}}' to list '${${list_name}}'")
            list(APPEND "${list_name}" "${${element_name}}")
            list(LENGTH "${list_name}" list_len)
            message("Result: '${${list_name}}' (length = ${list_len})\n")
            set("${list_name}" "${${list_name}}" PARENT_SCOPE)
      endfunction()

      message("\nAdding non-empty element to non-empty list.\n")
      set(mylist "a;b")
      set(element "c")

      foreach(i RANGE 3)
            add_element(mylist element)
      endforeach()


      message("\nAdding empty element to non-empty list.\n")
      set(mylist "a;b")
      set(element "")

      foreach(i RANGE 3)
            add_element(mylist element)
      endforeach()

      message("\nAdding empty element to empty list.\n")
      set(mylist "")
      set(element "")

      foreach(i RANGE 3)
            add_element(mylist element)
      endforeach()


endif()

#recommendation
# use short laconic lower-case names(a, i, mylist, object, etc) for local variables
# that used by the current scope. use long detailed upper-case names(FOO_FEATURE, BOO_ENABLE_SOMETHING, etc.)
# for variables that used by several scopes
