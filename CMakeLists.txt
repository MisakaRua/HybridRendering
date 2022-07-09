cmake_minimum_required( VERSION 3.6 )
project("HybridRendering")

set_property( GLOBAL PROPERTY USE_FOLDERS ON )
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

if(MSVC)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP /bigobj")
endif()

# Makefile generators on apple need this flag to compile mixed objective/c++
if( APPLE AND NOT XCODE )
	set( CMAKE_CXX_FLAGS "-ObjC++" )
endif()

option( BGFX_CUSTOM_TARGETS   "Include convenience custom targets."           ON  )
option( BGFX_CONFIG_RENDERER_WEBGPU     "Enables the webgpu renderer"         OFF )

set( BGFX_OPENGL_VERSION   ""       CACHE STRING "Specify minimum opengl version" )
set( BGFX_OPENGLES_VERSION ""       CACHE STRING "Specify minimum OpenGL ES version" )
set( BGFX_LIBRARY_TYPE     "STATIC" CACHE STRING "Linking type for library" )

set_property( CACHE BGFX_LIBRARY_TYPE PROPERTY STRINGS STATIC SHARED )

if( BGFX_LIBRARY_TYPE MATCHES "SHARED" )
    set(CMAKE_POSITION_INDEPENDENT_CODE ON)
endif()

if( NOT BX_DIR )
	set( BX_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bx" CACHE STRING "Location of bx." )
elseif( NOT IS_ABSOLUTE "${BX_DIR}")
	get_filename_component(BX_DIR "${BX_DIR}" REALPATH BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
endif()
if( NOT BIMG_DIR )
	set( BIMG_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bimg" CACHE STRING "Location of bimg." )
elseif( NOT IS_ABSOLUTE "${BIMG_DIR}")
	get_filename_component(BIMG_DIR "${BIMG_DIR}" REALPATH BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
endif()
if( NOT BGFX_DIR )
	set( BGFX_DIR "${CMAKE_CURRENT_SOURCE_DIR}/bgfx" CACHE STRING "Location of bgfx." )
elseif( NOT IS_ABSOLUTE "${BGFX_DIR}")
	get_filename_component(BGFX_DIR "${BGFX_DIR}" REALPATH BASE_DIR "${CMAKE_CURRENT_SOURCE_DIR}")
endif()

include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/shared.cmake )
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bx.cmake )
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bimg.cmake )
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/bgfx.cmake )
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/tools.cmake )
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/examples.cmake )
include( ${CMAKE_CURRENT_SOURCE_DIR}/cmake/hybrid_rendering.cmake )

set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT hybrid_rendering)

add_custom_command(TARGET hybrid_rendering POST_BUILD
	COMMAND ${CMAKE_COMMAND} -E echo "Copying shader to build folder."
	# COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/hybrid_rendering/shaders/bin/glsl ${CMAKE_CURRENT_SOURCE_DIR}/build/shaders/glsl
	# COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/hybrid_rendering/shaders/bin/dx11 ${CMAKE_CURRENT_SOURCE_DIR}/build/shaders/dx11
	COMMAND ${CMAKE_COMMAND} -E copy_directory ${CMAKE_CURRENT_SOURCE_DIR}/hybrid_rendering/shaders/bin/dx9 ${CMAKE_CURRENT_SOURCE_DIR}/build/shaders/dx9
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/dxup/build/src/d3d9/d3d9.dll ${CMAKE_CURRENT_SOURCE_DIR}/build/Debug
    COMMAND ${CMAKE_COMMAND} -E copy ${CMAKE_CURRENT_SOURCE_DIR}/dxup/build/src/d3d9/d3d9.pdb ${CMAKE_CURRENT_SOURCE_DIR}/build/Debug
)