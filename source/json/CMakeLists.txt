set(libjsonname ${LIB_JSON})
file(GLOB LIB_SRC src/*.cpp src/*.h)
file(GLOB INC_SRC include/*.h)


add_library(${libjsonname} STATIC ${LIB_SRC})
target_include_directories(${libjsonname} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include include/)



# set_target_properties(${libname} PROPERTIES INSTALL_RPATH $ORIGIN)
install(TARGETS ${libjsonname} DESTINATION ${CMAKE_SOURCE_DIR}/../lib/)
# install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/include/json DESTINATION	${CMAKE_SOURCE_DIR}/include/)
