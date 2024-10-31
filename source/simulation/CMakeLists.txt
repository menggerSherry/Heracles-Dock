file(GLOB SRC *.cc)
set(exename "lightdock")

set(TEST_READ run_simulation.cc)
add_executable(${exename} ${TEST_READ})
target_include_directories(${exename} PUBLIC ${CMAKE_SOURCE_DIR}/prep/include ${CMAKE_SOURCE_DIR}/dock/include)
target_link_libraries(${exename} PUBLIC ${LIB_PRE} ${LIB_JSON} ${LIB_SASA} ${LIB_DOCK})




# set_target_properties(${libname} PROPERTIES INSTALL_RPATH $ORIGIN)
install(TARGETS ${exename} DESTINATION ${CMAKE_SOURCE_DIR}/../bin/)
