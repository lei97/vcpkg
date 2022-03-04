cmake_minimum_required(VERSION 2.8)

project(libid3tag)

set(SOURCES
    compat.c
    compat.h
    crc.c
    crc.h
    debug.c
    debug.h
    field.c
    field.h
    file.c
    file.h
    frame.h
    frame.c
    frametype.c
    frametype.h
    genre.c
    genre.h
    global.h
    id3tag.h
    latin1.c
    latin1.h
    parse.c
    parse.h
    render.c
    render.h
    tag.c
    tag.h
    ucs4.c
    ucs4.h
    utf8.c
    utf8.h
    utf16.c
    utf16.h
    util.c
    util.h
    version.c
    version.h
)

add_library(
    id3tag
    ${SOURCES}
)

find_package(ZLIB REQUIRED)
target_link_libraries(id3tag PRIVATE ZLIB::ZLIB)

install(
    TARGETS id3tag
    RUNTIME DESTINATION bin
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib
)

install(
    FILES id3tag.h
    DESTINATION include
)
