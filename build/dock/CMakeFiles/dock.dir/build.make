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
include dock/CMakeFiles/dock.dir/depend.make

# Include the progress variables for this target.
include dock/CMakeFiles/dock.dir/progress.make

# Include the compile flags for this target's objects.
include dock/CMakeFiles/dock.dir/flags.make

dock/CMakeFiles/dock.dir/src/cal_anm.cc.o: dock/CMakeFiles/dock.dir/flags.make
dock/CMakeFiles/dock.dir/src/cal_anm.cc.o: /share/home/mengxiangyu/lightdockc/source/dock/src/cal_anm.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object dock/CMakeFiles/dock.dir/src/cal_anm.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dock.dir/src/cal_anm.cc.o -c /share/home/mengxiangyu/lightdockc/source/dock/src/cal_anm.cc

dock/CMakeFiles/dock.dir/src/cal_anm.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dock.dir/src/cal_anm.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/dock/src/cal_anm.cc > CMakeFiles/dock.dir/src/cal_anm.cc.i

dock/CMakeFiles/dock.dir/src/cal_anm.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dock.dir/src/cal_anm.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/dock/src/cal_anm.cc -o CMakeFiles/dock.dir/src/cal_anm.cc.s

dock/CMakeFiles/dock.dir/src/kmeans.cc.o: dock/CMakeFiles/dock.dir/flags.make
dock/CMakeFiles/dock.dir/src/kmeans.cc.o: /share/home/mengxiangyu/lightdockc/source/dock/src/kmeans.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object dock/CMakeFiles/dock.dir/src/kmeans.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dock.dir/src/kmeans.cc.o -c /share/home/mengxiangyu/lightdockc/source/dock/src/kmeans.cc

dock/CMakeFiles/dock.dir/src/kmeans.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dock.dir/src/kmeans.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/dock/src/kmeans.cc > CMakeFiles/dock.dir/src/kmeans.cc.i

dock/CMakeFiles/dock.dir/src/kmeans.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dock.dir/src/kmeans.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/dock/src/kmeans.cc -o CMakeFiles/dock.dir/src/kmeans.cc.s

dock/CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.o: dock/CMakeFiles/dock.dir/flags.make
dock/CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.o: /share/home/mengxiangyu/lightdockc/source/dock/src/prepare_gso_tasks.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object dock/CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.o -c /share/home/mengxiangyu/lightdockc/source/dock/src/prepare_gso_tasks.cc

dock/CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/dock/src/prepare_gso_tasks.cc > CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.i

dock/CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/dock/src/prepare_gso_tasks.cc -o CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.s

dock/CMakeFiles/dock.dir/src/swarm_centers.cc.o: dock/CMakeFiles/dock.dir/flags.make
dock/CMakeFiles/dock.dir/src/swarm_centers.cc.o: /share/home/mengxiangyu/lightdockc/source/dock/src/swarm_centers.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object dock/CMakeFiles/dock.dir/src/swarm_centers.cc.o"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/dock.dir/src/swarm_centers.cc.o -c /share/home/mengxiangyu/lightdockc/source/dock/src/swarm_centers.cc

dock/CMakeFiles/dock.dir/src/swarm_centers.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/dock.dir/src/swarm_centers.cc.i"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /share/home/mengxiangyu/lightdockc/source/dock/src/swarm_centers.cc > CMakeFiles/dock.dir/src/swarm_centers.cc.i

dock/CMakeFiles/dock.dir/src/swarm_centers.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/dock.dir/src/swarm_centers.cc.s"
	cd /share/home/mengxiangyu/lightdockc/build/dock && /share/app/gcc/gcc-11.4.0/bin/g++  -O2  -g -fpermissive -fPIC $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /share/home/mengxiangyu/lightdockc/source/dock/src/swarm_centers.cc -o CMakeFiles/dock.dir/src/swarm_centers.cc.s

# Object files for target dock
dock_OBJECTS = \
"CMakeFiles/dock.dir/src/cal_anm.cc.o" \
"CMakeFiles/dock.dir/src/kmeans.cc.o" \
"CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.o" \
"CMakeFiles/dock.dir/src/swarm_centers.cc.o"

# External object files for target dock
dock_EXTERNAL_OBJECTS =

dock/libdock.so: dock/CMakeFiles/dock.dir/src/cal_anm.cc.o
dock/libdock.so: dock/CMakeFiles/dock.dir/src/kmeans.cc.o
dock/libdock.so: dock/CMakeFiles/dock.dir/src/prepare_gso_tasks.cc.o
dock/libdock.so: dock/CMakeFiles/dock.dir/src/swarm_centers.cc.o
dock/libdock.so: dock/CMakeFiles/dock.dir/build.make
dock/libdock.so: json/libjson.a
dock/libdock.so: freesasa/libfreesasa.a
dock/libdock.so: /share/app/gcc/gcc-11.4.0/lib64/libgomp.so
dock/libdock.so: /lib64/libpthread.so
dock/libdock.so: dock/CMakeFiles/dock.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/share/home/mengxiangyu/lightdockc/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library libdock.so"
	cd /share/home/mengxiangyu/lightdockc/build/dock && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/dock.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
dock/CMakeFiles/dock.dir/build: dock/libdock.so

.PHONY : dock/CMakeFiles/dock.dir/build

dock/CMakeFiles/dock.dir/clean:
	cd /share/home/mengxiangyu/lightdockc/build/dock && $(CMAKE_COMMAND) -P CMakeFiles/dock.dir/cmake_clean.cmake
.PHONY : dock/CMakeFiles/dock.dir/clean

dock/CMakeFiles/dock.dir/depend:
	cd /share/home/mengxiangyu/lightdockc/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /share/home/mengxiangyu/lightdockc/source /share/home/mengxiangyu/lightdockc/source/dock /share/home/mengxiangyu/lightdockc/build /share/home/mengxiangyu/lightdockc/build/dock /share/home/mengxiangyu/lightdockc/build/dock/CMakeFiles/dock.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : dock/CMakeFiles/dock.dir/depend

