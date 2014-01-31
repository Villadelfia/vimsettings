cmake_minimum_required(VERSION 2.8)

#Project Name
project(MOODTESTS)

# Compiler check
if(${CMAKE_CXX_COMPILER_ID} STREQUAL "GNU")
    message(STATUS "Gcc mode.")
    set(COMPILE_FLAGS "-g3 -Os -Werror -Wextra -Wall -pedantic -pedantic-errors -std=c++11")
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "Intel")
    message(STATUS "Icc mode.")
    set(COMPILE_FLAGS "-g3 -Os -Werror -Wextra -Wall -pedantic -pedantic-errors -std=c++11")
elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL "Clang")
    message(STATUS "Clang mode.")
    set(CMAKE_COMPILER_IS_CLANG 1)
    set(COMPILE_FLAGS "-g3 -Os -Werror -Wextra -Wall -pedantic -pedantic-errors -std=c++11 -stdlib=libc++")
    set(CMAKE_EXE_LINKER_FLAGS "-std=c++11 -stdlib=libc++")
else()
    message(FATAL_ERROR "This compiler is not supported")
endif()

#Executable macro
macro(executable n)
    if(${ARGC} GREATER 1)
        add_executable(${n} ${ARGN})
        set_target_properties(${n} PROPERTIES COMPILE_FLAGS ${COMPILE_FLAGS})
    else()
        message(SEND_ERROR "Not enough arguments for executable macro.")
    endif()
endmacro()

#Executable
#executable(exename sourcefile[s])
executable(<+CURSOR+>)
