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
include simulation/CMakeFiles/lightdock.dir/depend.make

# Include the progress variables for this target.
include simulation/CMakeFiles/lightdock.dir/progress.make

# Include the compile flags for this target's objects.
include simulation/CMakeFiles/lightdock.dir/flags.make

simulation/CMakeFiles/lightdock.dir/run_simulation.cc.o: simulation/CMakeFiles/lightdock.dir/flags.make
simulation/CMakeFiles/lightdock.dir/run_simulation.cc.o: /share/home/mengxiangyu/lightdockc/source/simulation/run_simulation.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object simulation/CMakeFiles/lightdock.dir/run_simulation.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/simulation && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/lightdock.dir/run_simulation.cc.o -c /share/home/mengxiangyu/lightdockc/source/simulation/run_simulation.cc

simulation/CMakeFiles/lightdock.dir/run_simulation.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/lightdock.dir/run_simulation.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/simulation && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/simulation/run_simulation.cc > CMakeFiles/lightdock.dir/run_simulation.cc.i

simulation/CMakeFiles/lightdock.dir/run_simulation.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/lightdock.dir/run_simulation.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/simulation && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/simulation/run_simulation.cc -o CMakeFiles/lightdock.dir/run_simulation.cc.s

# Object files for target lightdock
lightdock_OBJECTS = \
"CMakeFiles/lightdock.dir/run_simulation.cc.o"

# External object files for target lightdock
lightdock_EXTERNAL_OBJECTS =

simulation/lightdock: simulation/CMakeFiles/lightdock.dir/run_simulation.cc.o
simulation/lightdock: simulation/CMakeFiles/lightdock.dir/build.make
simulation/lightdock: prep/libpre.so
simulation/lightdock: json/libjson.a
simulation/lightdock: freesasa/libfreesasa.a
simulation/lightdock: dock/libdock.so
simulation/lightdock: json/libjson.a
simulation/lightdock: freesasa/libfreesasa.a
simulation/lightdock: dock/src/cuda/liblight_dock_cuda.so
simulation/lightdock: /share/app/gcc/gcc-11.4.0/lib64/libgomp.so
simulation/lightdock: /lib64/libpthread.so
simulation/lightdock: /share/app/cuda/cuda-11.8/lib64/libcudart_static.a
simulation/lightdock: /usr/lib64/librt.so
simulation/lightdock: /share/app/cuda/cuda-11.8/lib64/libcudart_static.a
simulation/lightdock: /usr/lib64/librt.so
simulation/lightdock: /share/app/cuda/cuda-11.8/lib64/libcublas.so
simulation/lightdock: /share/app/cuda/cuda-11.8/lib64/libcusolver.so
simulation/lightdock: simulation/CMakeFiles/lightdock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable lightdock"
	cd /share/home/mengxiangyu/lightdockc/build/simulation && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/lightdock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
simulation/CMakeFiles/lightdock.dir/build: simulation/lightdock

.PHONY : simulation/CMakeFiles/lightdock.dir/build

simulation/CMakeFiles/lightdock.dir/clean:
	cd /share/home/mengxiangyu/lightdockc/build/simulation && $(CMAKE_COMMAND) -P CMakeFiles/lightdock.dir/cmake_clean.cmake
.PHONY : simulation/CMakeFiles/lightdock.dir/clean

simulation/CMakeFiles/lightdock.dir/depend:
	cd /share/home/mengxiangyu/lightdockc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /share/home/mengxiangyu/lightdockc/source /share/home/mengxiangyu/lightdockc/source/simulation /share/home/mengxiangyu/lightdockc/build /share/home/mengxiangyu/lightdockc/build/simulation /share/home/mengxiangyu/lightdockc/build/simulation/CMakeFiles/lightdock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : simulation/CMakeFiles/lightdock.dir/depend

