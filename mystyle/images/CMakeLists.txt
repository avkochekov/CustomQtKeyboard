file(GLOB_RECURSE IMAGES RELATIVE ${CMAKE_CURRENT_SOURCE_DIR} *.svg)

qt6_add_resources(${PROJECT_NAME} "images"
    PREFIX
        "/QtQuick/VirtualKeyboard/Styles/mystyle/images"
    FILES
        ${IMAGES}
)

