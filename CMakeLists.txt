cmake_minimum_required(VERSION 2.8.3)
project(testqt5_create)

## Find catkin macros and libraries
find_package(catkin REQUIRED COMPONENTS
            roscpp
            rospy
            std_msgs
            genmsg
            sensor_msgs
            cv_bridge
            image_transport)

set(CMAKE_INCLUDE_CURRENT_DIR ON)
set(CMAKE_AUTOMOC ON)

set(SOURCES src/main.cpp qml/main.qml )

set(HEADER_FILES include/subnode.h include/camera.h include/rescue_gui.h)


find_package(Qt5Core)
find_package(Qt5Gui)
find_package(Qt5Qml)
find_package(Qt5Widgets)
find_package(Qt5Quick)

set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage")

catkin_package()

include_directories(include ${catkin_INCLUDE_DIRS} ${Qt5Widgets_INCLUDES} ${Qt5Quick_INCLUDES})
add_executable(testqt5_create ${SOURCES} ${HEADER_FILES})
target_link_libraries(testqt5_create ${catkin_LIBRARIES} Qt5::Core Qt5::Gui Qt5::Qml Qt5::Widgets Qt5::Quick)





