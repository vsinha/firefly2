cmake_minimum_required(VERSION 2.8)
project(firefly2 LANGUAGES CXX)

# Download GoogleTest for mocks and test runner.
include(DownloadProject.cmake)
download_project(PROJ                googletest
                 GIT_REPOSITORY      https://github.com/google/googletest.git
                 GIT_TAG             master
                 UPDATE_DISCONNECTED 1
)

add_subdirectory(${googletest_SOURCE_DIR} ${googletest_BINARY_DIR})

# Set appropriate warning levels and include debug symbols.
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Wextra -pedantic -std=c++11 -g")

file(GLOB LIBRARY_SOURCES "*.cpp")
add_library(generic ${LIBRARY_SOURCES})
target_include_directories(generic PUBLIC
  $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}>
  $<INSTALL_INTERFACE:.>)

enable_testing()

file(GLOB TEST_SOURCES "test/*.cpp")

add_executable(generictest ${TEST_SOURCES})

target_link_libraries(generictest generic gmock_main gtest)
add_test(generictest generictest)
