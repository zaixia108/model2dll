cmake_minimum_required(VERSION 3.30)
project(onnx)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_WINDOWS_EXPORT_ALL_SYMBOLS ON)

file(MAKE_DIRECTORY ${CMAKE_BINARY_DIR}/model)
# Set output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/model)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/model)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/model)

include_directories(.)

# Change target name to 'model'
add_library(model SHARED
        normal.cpp)

# Set output name explicitly
set_target_properties(model PROPERTIES
        OUTPUT_NAME "model"
        PREFIX ""
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/model)