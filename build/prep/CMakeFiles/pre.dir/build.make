# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.17

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Produce verbose output by default.
VERBOSE = 1

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /share/home/mengxiangyu/cmake/bin/cmake

# The command to remove a file.
RM = /share/home/mengxiangyu/cmake/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /share/home/mengxiangyu/lightdockc/source

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /share/home/mengxiangyu/lightdockc/build

# Include any dependencies generated for this target.
include prep/CMakeFiles/pre.dir/depend.make

# Include the progress variables for this target.
include prep/CMakeFiles/pre.dir/progress.make

# Include the compile flags for this target's objects.
include prep/CMakeFiles/pre.dir/flags.make

prep/CMakeFiles/pre.dir/src/complex.cc.o: prep/CMakeFiles/pre.dir/flags.make
prep/CMakeFiles/pre.dir/src/complex.cc.o: /share/home/mengxiangyu/lightdockc/source/prep/src/complex.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object prep/CMakeFiles/pre.dir/src/complex.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pre.dir/src/complex.cc.o -c /share/home/mengxiangyu/lightdockc/source/prep/src/complex.cc

prep/CMakeFiles/pre.dir/src/complex.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pre.dir/src/complex.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/prep/src/complex.cc > CMakeFiles/pre.dir/src/complex.cc.i

prep/CMakeFiles/pre.dir/src/complex.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pre.dir/src/complex.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/prep/src/complex.cc -o CMakeFiles/pre.dir/src/complex.cc.s

prep/CMakeFiles/pre.dir/src/initialization.cc.o: prep/CMakeFiles/pre.dir/flags.make
prep/CMakeFiles/pre.dir/src/initialization.cc.o: /share/home/mengxiangyu/lightdockc/source/prep/src/initialization.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object prep/CMakeFiles/pre.dir/src/initialization.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pre.dir/src/initialization.cc.o -c /share/home/mengxiangyu/lightdockc/source/prep/src/initialization.cc

prep/CMakeFiles/pre.dir/src/initialization.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pre.dir/src/initialization.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/prep/src/initialization.cc > CMakeFiles/pre.dir/src/initialization.cc.i

prep/CMakeFiles/pre.dir/src/initialization.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pre.dir/src/initialization.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/prep/src/initialization.cc -o CMakeFiles/pre.dir/src/initialization.cc.s

prep/CMakeFiles/pre.dir/src/read_input_structure.cc.o: prep/CMakeFiles/pre.dir/flags.make
prep/CMakeFiles/pre.dir/src/read_input_structure.cc.o: /share/home/mengxiangyu/lightdockc/source/prep/src/read_input_structure.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object prep/CMakeFiles/pre.dir/src/read_input_structure.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pre.dir/src/read_input_structure.cc.o -c /share/home/mengxiangyu/lightdockc/source/prep/src/read_input_structure.cc

prep/CMakeFiles/pre.dir/src/read_input_structure.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pre.dir/src/read_input_structure.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/prep/src/read_input_structure.cc > CMakeFiles/pre.dir/src/read_input_structure.cc.i

prep/CMakeFiles/pre.dir/src/read_input_structure.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pre.dir/src/read_input_structure.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/prep/src/read_input_structure.cc -o CMakeFiles/pre.dir/src/read_input_structure.cc.s

prep/CMakeFiles/pre.dir/src/translate.cc.o: prep/CMakeFiles/pre.dir/flags.make
prep/CMakeFiles/pre.dir/src/translate.cc.o: /share/home/mengxiangyu/lightdockc/source/prep/src/translate.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object prep/CMakeFiles/pre.dir/src/translate.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pre.dir/src/translate.cc.o -c /share/home/mengxiangyu/lightdockc/source/prep/src/translate.cc

prep/CMakeFiles/pre.dir/src/translate.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pre.dir/src/translate.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/prep/src/translate.cc > CMakeFiles/pre.dir/src/translate.cc.i

prep/CMakeFiles/pre.dir/src/translate.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pre.dir/src/translate.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/prep/src/translate.cc -o CMakeFiles/pre.dir/src/translate.cc.s

prep/CMakeFiles/pre.dir/src/unipoint.cc.o: prep/CMakeFiles/pre.dir/flags.make
prep/CMakeFiles/pre.dir/src/unipoint.cc.o: /share/home/mengxiangyu/lightdockc/source/prep/src/unipoint.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object prep/CMakeFiles/pre.dir/src/unipoint.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/pre.dir/src/unipoint.cc.o -c /share/home/mengxiangyu/lightdockc/source/prep/src/unipoint.cc

prep/CMakeFiles/pre.dir/src/unipoint.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pre.dir/src/unipoint.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/prep/src/unipoint.cc > CMakeFiles/pre.dir/src/unipoint.cc.i

prep/CMakeFiles/pre.dir/src/unipoint.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pre.dir/src/unipoint.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/prep && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/prep/src/unipoint.cc -o CMakeFiles/pre.dir/src/unipoint.cc.s

# Object files for target pre
pre_OBJECTS = \
"CMakeFiles/pre.dir/src/complex.cc.o" \
"CMakeFiles/pre.dir/src/initialization.cc.o" \
"CMakeFiles/pre.dir/src/read_input_structure.cc.o" \
"CMakeFiles/pre.dir/src/translate.cc.o" \
"CMakeFiles/pre.dir/src/unipoint.cc.o"

# External object files for target pre
pre_EXTERNAL_OBJECTS =

prep/libpre.so: prep/CMakeFiles/pre.dir/src/complex.cc.o
prep/libpre.so: prep/CMakeFiles/pre.dir/src/initialization.cc.o
prep/libpre.so: prep/CMakeFiles/pre.dir/src/read_input_structure.cc.o
prep/libpre.so: prep/CMakeFiles/pre.dir/src/translate.cc.o
prep/libpre.so: prep/CMakeFiles/pre.dir/src/unipoint.cc.o
prep/libpre.so: prep/CMakeFiles/pre.dir/build.make
prep/libpre.so: json/libjson.a
prep/libpre.so: freesasa/libfreesasa.a
prep/libpre.so: /share/app/gcc/gcc-11.4.0/lib64/libgomp.so
prep/libpre.so: /lib64/libpthread.so
prep/libpre.so: prep/CMakeFiles/pre.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX shared library libpre.so"
	cd /share/home/mengxiangyu/lightdockc/build/prep && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pre.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
prep/CMakeFiles/pre.dir/build: prep/libpre.so

.PHONY : prep/CMakeFiles/pre.dir/build

prep/CMakeFiles/pre.dir/clean:
	cd /share/home/mengxiangyu/lightdockc/build/prep && $(CMAKE_COMMAND) -P CMakeFiles/pre.dir/cmake_clean.cmake
.PHONY : prep/CMakeFiles/pre.dir/clean

prep/CMakeFiles/pre.dir/depend:
	cd /share/home/mengxiangyu/lightdockc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /share/home/mengxiangyu/lightdockc/source /share/home/mengxiangyu/lightdockc/source/prep /share/home/mengxiangyu/lightdockc/build /share/home/mengxiangyu/lightdockc/build/prep /share/home/mengxiangyu/lightdockc/build/prep/CMakeFiles/pre.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : prep/CMakeFiles/pre.dir/depend
