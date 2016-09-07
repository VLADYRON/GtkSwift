cmake_minimum_required(VERSION 3.4)
project(GtkSwift)

file(GLOB SOURCES "Sources/*.swift")

add_custom_target(GtkSwift
        COMMAND swift build
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES Package.swift ${SOURCES})

