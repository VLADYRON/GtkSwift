cmake_minimum_required(VERSION 3.4)
project(GtkSwift)

file(GLOB SOURCES "Sources/*.swift")

add_custom_target(GtkSwift
        COMMAND swift build -Xcc -I/usr/include/cairo -Xcc -I/usr/include/gtk-3.0 -Xcc -I/usr/include/glib-2.0 -Xcc -I/usr/include/pango-1.0 -Xcc -I/usr/include/gdk-pixbuf-2.0 -Xcc -I/usr/include/atk-1.0 -Xcc -I/usr/lib/x86_64-linux-gnu/glib-2.0/include
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        SOURCES Package.swift ${SOURCES})