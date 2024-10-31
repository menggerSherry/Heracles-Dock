set(libname ${LIB_DOCK})
file(GLOB LIB_SRC src/*.cc)
file(GLOB INC_SRC include/*.h)
set(DC_PATH ${PROJECT_SOURCE_DIR})
configure_file(${CMAKE_CURRENT_SOURCE_DIR}/include/path_include.h.in ${CMAKE_CURRENT_SOURCE_DIR}/include/path_include.h)

add_library(${libname} SHARED ${LIB_SRC})
target_include_directories(${libname} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include ${CMAKE_SOURCE_DIR}/prep/include)
target_include_directories(${libname} PUBLIC ../json/include ../freesasa)


# target_link_libraries (${libname} ${LIB_SASA})
add_subdirectory(src/cuda)
set (EXTRA_LIBS ${EXTRA_LIBS} light_dock_cuda)
target_link_libraries (${libname} INTERFACE ${CUDA_LIBRARIES} ${EXTRA_LIBS})
# target_link_libraries (${libname} ${LIB_SASA})
target_link_libraries(${libname}  PUBLIC ${LIB_JSON} ${LIB_SASA} OpenMP::OpenMP_CXX)

# set_target_properties(${libname} PROPERTIES INSTALL_RPATH $ORIGIN)
install(TARGETS ${libname} DESTINATION ${CMAKE_SOURCE_DIR}/../lib/)
# install(FILES ${INC_SRC} DESTINATION	${CMAKE_SOURCE_DIR}/include/)