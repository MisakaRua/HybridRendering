set( HYBRID_RENDERING_DIR "${CMAKE_CURRENT_SOURCE_DIR}/hybrid_rendering")

# 在此处添加文件
file(GLOB HYBRID_RENDERING_SRC CONFIGURE_DEPENDS ${HYBRID_RENDERING_DIR}/src/*.h ${HYBRID_RENDERING_DIR}/src/*.cpp)

source_group(hybrid_rendering FILES ${HYBRID_RENDERING_SRC})

add_executable(hybrid_rendering
	${HYBRID_RENDERING_SRC}
)
target_link_libraries(hybrid_rendering
	example-common
)
target_include_directories(hybrid_rendering
	PRIVATE ${HYBRID_RENDERING_DIR}/src
)

# Special Visual Studio Flags
if(MSVC)
	target_compile_definitions(
		hybrid_rendering
		PRIVATE "_CRT_SECURE_NO_WARNINGS"
	)
endif()
