vcpkg_check_linkage(ONLY_STATIC_LIBRARY)

vcpkg_from_sourceforge(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO mad/libid3tag
    REF 0.15.1b
    FILENAME "libid3tag-0.15.1b.tar.gz"
    SHA512 ade7ce2a43c3646b4c9fdc642095174b9d4938b078b205cd40906d525acd17e87ad76064054a961f391edcba6495441450af2f68be69f116549ca666b069e6d3
)

#The archive only contains a Visual Studio 6.0 era DSP project file, so use a custom CMakeLists.txt
file(COPY ${CMAKE_CURRENT_LIST_DIR}/CMakeLists.txt DESTINATION ${SOURCE_PATH})

#Use the msvc++ config.h header
file(COPY ${SOURCE_PATH}/msvc++/config.h DESTINATION ${SOURCE_PATH})

vcpkg_configure_cmake(
    SOURCE_PATH ${SOURCE_PATH}
    PREFER_NINJA
)

vcpkg_install_cmake()
vcpkg_copy_pdbs()

file(COPY ${SOURCE_PATH}/COPYING DESTINATION ${CURRENT_PACKAGES_DIR}/share/libid3tag)
file(RENAME ${CURRENT_PACKAGES_DIR}/share/libid3tag/COPYING ${CURRENT_PACKAGES_DIR}/share/libid3tag/copyright)

file(REMOVE_RECURSE ${CURRENT_PACKAGES_DIR}/debug/include)
