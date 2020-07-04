#!/usr/bin/tclsh

# file copy using command line arguments 

proc usage {} {
	# proc definition
	puts stderr Usage:;   # error redirection 
	puts stderr "$::argv0 source-file dest-file"
	exit 1
}

if { $argc != 2 } {
	usage;  # proc call 
}

file copy [lindex $argv 0] [lindex $argv 1]

