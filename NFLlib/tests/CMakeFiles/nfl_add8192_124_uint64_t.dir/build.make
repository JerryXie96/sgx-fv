# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.20

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

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/bin/cmake

# The command to remove a file.
RM = /usr/local/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/hongchxie2/github/sgx-fv/NFLlib

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/hongchxie2/github/sgx-fv/NFLlib

# Include any dependencies generated for this target.
include tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/compiler_depend.make

# Include the progress variables for this target.
include tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/progress.make

# Include the compile flags for this target's objects.
include tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/flags.make

tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o: tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/flags.make
tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o: tests/nfl_add8192_124_uint64_t.cpp
tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o: tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/hongchxie2/github/sgx-fv/NFLlib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o"
	cd /home/hongchxie2/github/sgx-fv/NFLlib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o -MF CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o.d -o CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o -c /home/hongchxie2/github/sgx-fv/NFLlib/tests/nfl_add8192_124_uint64_t.cpp

tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.i"
	cd /home/hongchxie2/github/sgx-fv/NFLlib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/hongchxie2/github/sgx-fv/NFLlib/tests/nfl_add8192_124_uint64_t.cpp > CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.i

tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.s"
	cd /home/hongchxie2/github/sgx-fv/NFLlib/tests && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/hongchxie2/github/sgx-fv/NFLlib/tests/nfl_add8192_124_uint64_t.cpp -o CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.s

# Object files for target nfl_add8192_124_uint64_t
nfl_add8192_124_uint64_t_OBJECTS = \
"CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o"

# External object files for target nfl_add8192_124_uint64_t
nfl_add8192_124_uint64_t_EXTERNAL_OBJECTS =

tests/nfl_add8192_124_uint64_t: tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/nfl_add8192_124_uint64_t.cpp.o
tests/nfl_add8192_124_uint64_t: tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/build.make
tests/nfl_add8192_124_uint64_t: libnfllib.so
tests/nfl_add8192_124_uint64_t: /usr/local/lib/libgmp.so
tests/nfl_add8192_124_uint64_t: /usr/local/lib/libmpfr.so
tests/nfl_add8192_124_uint64_t: tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/hongchxie2/github/sgx-fv/NFLlib/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable nfl_add8192_124_uint64_t"
	cd /home/hongchxie2/github/sgx-fv/NFLlib/tests && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/nfl_add8192_124_uint64_t.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/build: tests/nfl_add8192_124_uint64_t
.PHONY : tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/build

tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/clean:
	cd /home/hongchxie2/github/sgx-fv/NFLlib/tests && $(CMAKE_COMMAND) -P CMakeFiles/nfl_add8192_124_uint64_t.dir/cmake_clean.cmake
.PHONY : tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/clean

tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/depend:
	cd /home/hongchxie2/github/sgx-fv/NFLlib && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/hongchxie2/github/sgx-fv/NFLlib /home/hongchxie2/github/sgx-fv/NFLlib/tests /home/hongchxie2/github/sgx-fv/NFLlib /home/hongchxie2/github/sgx-fv/NFLlib/tests /home/hongchxie2/github/sgx-fv/NFLlib/tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : tests/CMakeFiles/nfl_add8192_124_uint64_t.dir/depend
