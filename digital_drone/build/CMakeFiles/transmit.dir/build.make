# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

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
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/samuelsm/skytrade/emitting/transmitter-linux

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/samuelsm/skytrade/emitting/transmitter-linux/build

# Include any dependencies generated for this target.
include CMakeFiles/transmit.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/transmit.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/transmit.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/transmit.dir/flags.make

CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o: ../hostapd/src/utils/os_unix.c
CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o -MF CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o.d -o CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/os_unix.c

CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/os_unix.c > CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.i

CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/os_unix.c -o CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.s

CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o: ../hostapd/src/common/cli.c
CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o -MF CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o.d -o CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/common/cli.c

CMakeFiles/transmit.dir/hostapd/src/common/cli.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/hostapd/src/common/cli.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/common/cli.c > CMakeFiles/transmit.dir/hostapd/src/common/cli.c.i

CMakeFiles/transmit.dir/hostapd/src/common/cli.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/hostapd/src/common/cli.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/common/cli.c -o CMakeFiles/transmit.dir/hostapd/src/common/cli.c.s

CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o: ../hostapd/src/common/wpa_ctrl.c
CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o -MF CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o.d -o CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/common/wpa_ctrl.c

CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/common/wpa_ctrl.c > CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.i

CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/common/wpa_ctrl.c -o CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.s

CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o: ../hostapd/src/utils/common.c
CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o -MF CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o.d -o CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/common.c

CMakeFiles/transmit.dir/hostapd/src/utils/common.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/hostapd/src/utils/common.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/common.c > CMakeFiles/transmit.dir/hostapd/src/utils/common.c.i

CMakeFiles/transmit.dir/hostapd/src/utils/common.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/hostapd/src/utils/common.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/common.c -o CMakeFiles/transmit.dir/hostapd/src/utils/common.c.s

CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o: ../hostapd/src/utils/edit.c
CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o -MF CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o.d -o CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/edit.c

CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/edit.c > CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.i

CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/edit.c -o CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.s

CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o: ../hostapd/src/utils/eloop.c
CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Building C object CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o -MF CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o.d -o CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/eloop.c

CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/eloop.c > CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.i

CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/eloop.c -o CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.s

CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o: ../hostapd/src/utils/wpa_debug.c
CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Building C object CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o -MF CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o.d -o CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/wpa_debug.c

CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/wpa_debug.c > CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.i

CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/hostapd/src/utils/wpa_debug.c -o CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.s

CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o: ../core-c/libopendroneid/opendroneid.c
CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Building C object CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o -MF CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o.d -o CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/core-c/libopendroneid/opendroneid.c

CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/core-c/libopendroneid/opendroneid.c > CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.i

CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/core-c/libopendroneid/opendroneid.c -o CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.s

CMakeFiles/transmit.dir/bluez/lib/hci.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/bluez/lib/hci.c.o: ../bluez/lib/hci.c
CMakeFiles/transmit.dir/bluez/lib/hci.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "Building C object CMakeFiles/transmit.dir/bluez/lib/hci.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/bluez/lib/hci.c.o -MF CMakeFiles/transmit.dir/bluez/lib/hci.c.o.d -o CMakeFiles/transmit.dir/bluez/lib/hci.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/bluez/lib/hci.c

CMakeFiles/transmit.dir/bluez/lib/hci.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/bluez/lib/hci.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/bluez/lib/hci.c > CMakeFiles/transmit.dir/bluez/lib/hci.c.i

CMakeFiles/transmit.dir/bluez/lib/hci.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/bluez/lib/hci.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/bluez/lib/hci.c -o CMakeFiles/transmit.dir/bluez/lib/hci.c.s

CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o: ../bluez/lib/bluetooth.c
CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_10) "Building C object CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o -MF CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o.d -o CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/bluez/lib/bluetooth.c

CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/bluez/lib/bluetooth.c > CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.i

CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/bluez/lib/bluetooth.c -o CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.s

CMakeFiles/transmit.dir/ap_interface.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/ap_interface.c.o: ../ap_interface.c
CMakeFiles/transmit.dir/ap_interface.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_11) "Building C object CMakeFiles/transmit.dir/ap_interface.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/ap_interface.c.o -MF CMakeFiles/transmit.dir/ap_interface.c.o.d -o CMakeFiles/transmit.dir/ap_interface.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/ap_interface.c

CMakeFiles/transmit.dir/ap_interface.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/ap_interface.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/ap_interface.c > CMakeFiles/transmit.dir/ap_interface.c.i

CMakeFiles/transmit.dir/ap_interface.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/ap_interface.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/ap_interface.c -o CMakeFiles/transmit.dir/ap_interface.c.s

CMakeFiles/transmit.dir/utils.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/utils.c.o: ../utils.c
CMakeFiles/transmit.dir/utils.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_12) "Building C object CMakeFiles/transmit.dir/utils.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/utils.c.o -MF CMakeFiles/transmit.dir/utils.c.o.d -o CMakeFiles/transmit.dir/utils.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/utils.c

CMakeFiles/transmit.dir/utils.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/utils.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/utils.c > CMakeFiles/transmit.dir/utils.c.i

CMakeFiles/transmit.dir/utils.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/utils.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/utils.c -o CMakeFiles/transmit.dir/utils.c.s

CMakeFiles/transmit.dir/bluetooth.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/bluetooth.c.o: ../bluetooth.c
CMakeFiles/transmit.dir/bluetooth.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_13) "Building C object CMakeFiles/transmit.dir/bluetooth.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/bluetooth.c.o -MF CMakeFiles/transmit.dir/bluetooth.c.o.d -o CMakeFiles/transmit.dir/bluetooth.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/bluetooth.c

CMakeFiles/transmit.dir/bluetooth.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/bluetooth.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/bluetooth.c > CMakeFiles/transmit.dir/bluetooth.c.i

CMakeFiles/transmit.dir/bluetooth.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/bluetooth.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/bluetooth.c -o CMakeFiles/transmit.dir/bluetooth.c.s

CMakeFiles/transmit.dir/wifi_beacon.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/wifi_beacon.c.o: ../wifi_beacon.c
CMakeFiles/transmit.dir/wifi_beacon.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_14) "Building C object CMakeFiles/transmit.dir/wifi_beacon.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/wifi_beacon.c.o -MF CMakeFiles/transmit.dir/wifi_beacon.c.o.d -o CMakeFiles/transmit.dir/wifi_beacon.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/wifi_beacon.c

CMakeFiles/transmit.dir/wifi_beacon.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/wifi_beacon.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/wifi_beacon.c > CMakeFiles/transmit.dir/wifi_beacon.c.i

CMakeFiles/transmit.dir/wifi_beacon.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/wifi_beacon.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/wifi_beacon.c -o CMakeFiles/transmit.dir/wifi_beacon.c.s

CMakeFiles/transmit.dir/gpsmod.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/gpsmod.c.o: ../gpsmod.c
CMakeFiles/transmit.dir/gpsmod.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_15) "Building C object CMakeFiles/transmit.dir/gpsmod.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/gpsmod.c.o -MF CMakeFiles/transmit.dir/gpsmod.c.o.d -o CMakeFiles/transmit.dir/gpsmod.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/gpsmod.c

CMakeFiles/transmit.dir/gpsmod.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/gpsmod.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/gpsmod.c > CMakeFiles/transmit.dir/gpsmod.c.i

CMakeFiles/transmit.dir/gpsmod.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/gpsmod.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/gpsmod.c -o CMakeFiles/transmit.dir/gpsmod.c.s

CMakeFiles/transmit.dir/transmit.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/transmit.c.o: ../transmit.c
CMakeFiles/transmit.dir/transmit.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_16) "Building C object CMakeFiles/transmit.dir/transmit.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/transmit.c.o -MF CMakeFiles/transmit.dir/transmit.c.o.d -o CMakeFiles/transmit.dir/transmit.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/transmit.c

CMakeFiles/transmit.dir/transmit.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/transmit.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/transmit.c > CMakeFiles/transmit.dir/transmit.c.i

CMakeFiles/transmit.dir/transmit.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/transmit.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/transmit.c -o CMakeFiles/transmit.dir/transmit.c.s

CMakeFiles/transmit.dir/print_bt_features.c.o: CMakeFiles/transmit.dir/flags.make
CMakeFiles/transmit.dir/print_bt_features.c.o: ../print_bt_features.c
CMakeFiles/transmit.dir/print_bt_features.c.o: CMakeFiles/transmit.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_17) "Building C object CMakeFiles/transmit.dir/print_bt_features.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/transmit.dir/print_bt_features.c.o -MF CMakeFiles/transmit.dir/print_bt_features.c.o.d -o CMakeFiles/transmit.dir/print_bt_features.c.o -c /home/samuelsm/skytrade/emitting/transmitter-linux/print_bt_features.c

CMakeFiles/transmit.dir/print_bt_features.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/transmit.dir/print_bt_features.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/samuelsm/skytrade/emitting/transmitter-linux/print_bt_features.c > CMakeFiles/transmit.dir/print_bt_features.c.i

CMakeFiles/transmit.dir/print_bt_features.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/transmit.dir/print_bt_features.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/samuelsm/skytrade/emitting/transmitter-linux/print_bt_features.c -o CMakeFiles/transmit.dir/print_bt_features.c.s

# Object files for target transmit
transmit_OBJECTS = \
"CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o" \
"CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o" \
"CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o" \
"CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o" \
"CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o" \
"CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o" \
"CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o" \
"CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o" \
"CMakeFiles/transmit.dir/bluez/lib/hci.c.o" \
"CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o" \
"CMakeFiles/transmit.dir/ap_interface.c.o" \
"CMakeFiles/transmit.dir/utils.c.o" \
"CMakeFiles/transmit.dir/bluetooth.c.o" \
"CMakeFiles/transmit.dir/wifi_beacon.c.o" \
"CMakeFiles/transmit.dir/gpsmod.c.o" \
"CMakeFiles/transmit.dir/transmit.c.o" \
"CMakeFiles/transmit.dir/print_bt_features.c.o"

# External object files for target transmit
transmit_EXTERNAL_OBJECTS =

transmit: CMakeFiles/transmit.dir/hostapd/src/utils/os_unix.c.o
transmit: CMakeFiles/transmit.dir/hostapd/src/common/cli.c.o
transmit: CMakeFiles/transmit.dir/hostapd/src/common/wpa_ctrl.c.o
transmit: CMakeFiles/transmit.dir/hostapd/src/utils/common.c.o
transmit: CMakeFiles/transmit.dir/hostapd/src/utils/edit.c.o
transmit: CMakeFiles/transmit.dir/hostapd/src/utils/eloop.c.o
transmit: CMakeFiles/transmit.dir/hostapd/src/utils/wpa_debug.c.o
transmit: CMakeFiles/transmit.dir/core-c/libopendroneid/opendroneid.c.o
transmit: CMakeFiles/transmit.dir/bluez/lib/hci.c.o
transmit: CMakeFiles/transmit.dir/bluez/lib/bluetooth.c.o
transmit: CMakeFiles/transmit.dir/ap_interface.c.o
transmit: CMakeFiles/transmit.dir/utils.c.o
transmit: CMakeFiles/transmit.dir/bluetooth.c.o
transmit: CMakeFiles/transmit.dir/wifi_beacon.c.o
transmit: CMakeFiles/transmit.dir/gpsmod.c.o
transmit: CMakeFiles/transmit.dir/transmit.c.o
transmit: CMakeFiles/transmit.dir/print_bt_features.c.o
transmit: CMakeFiles/transmit.dir/build.make
transmit: ../gpsd/gpsd-dev/libgps.so
transmit: CMakeFiles/transmit.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_18) "Linking C executable transmit"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/transmit.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/transmit.dir/build: transmit
.PHONY : CMakeFiles/transmit.dir/build

CMakeFiles/transmit.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/transmit.dir/cmake_clean.cmake
.PHONY : CMakeFiles/transmit.dir/clean

CMakeFiles/transmit.dir/depend:
	cd /home/samuelsm/skytrade/emitting/transmitter-linux/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/samuelsm/skytrade/emitting/transmitter-linux /home/samuelsm/skytrade/emitting/transmitter-linux /home/samuelsm/skytrade/emitting/transmitter-linux/build /home/samuelsm/skytrade/emitting/transmitter-linux/build /home/samuelsm/skytrade/emitting/transmitter-linux/build/CMakeFiles/transmit.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/transmit.dir/depend

