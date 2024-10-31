set(sasaname ${LIB_SASA})
file(GLOB LIB_SRC classifier.c classifier.h classifier_protor.c classifier_oons.c classifier_naccess.c 
coord.c coord.h pdb.c pdb.h log.c sasa_lr.c sasa_sr.c structure.c node.c freesasa.c freesasa.h freesasa_internal.h nb.h nb.c util.c rsa.c 
selection.h selection.c lexer.c lexer.h parser.c parser.h)


add_library(${sasaname} STATIC ${LIB_SRC})





# set_target_properties(${libname} PROPERTIES INSTALL_RPATH $ORIGIN)

install(TARGETS ${sasaname} DESTINATION ${CMAKE_SOURCE_DIR}/../lib/)
# install(FILES ${LIB_SRC} DESTINATION	${CMAKE_SOURCE_DIR}/include/)