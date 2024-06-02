cmake_minimum_required(VERSION 3.16)
project(CustomQtKeyboard LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)

find_package(Qt6 REQUIRED COMPONENTS Core Gui Qml Quick)

qt_add_executable(${PROJECT_NAME}
    main.cpp
)

set_target_properties(${PROJECT_NAME} PROPERTIES
    WIN32_EXECUTABLE TRUE
    MACOSX_BUNDLE TRUE
)

target_link_libraries(${PROJECT_NAME} PUBLIC
    Qt::Core
    Qt::Gui
    Qt::Qml
    Qt::Quick
)

# Resources:
qt6_add_resources(${PROJECT_NAME}
    PREFIX
        "/"
    FILES
        main.qml
)

add_subdirectory(mystyle/)

if(QT_FEATURE_static)
    find_package(Qt6 REQUIRED COMPONENTS Svg)
    target_link_libraries(${PROJECT_NAME} PUBLIC
        Qt::Svg
    )
endif()

install(TARGETS ${PROJECT_NAME}
    RUNTIME DESTINATION "${INSTALL_EXAMPLEDIR}"
    BUNDLE DESTINATION "${INSTALL_EXAMPLEDIR}"
    LIBRARY DESTINATION "${INSTALL_EXAMPLEDIR}"
)
