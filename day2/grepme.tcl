# minimal unix like grep cmd, demo for the log parser

#set pattern "bash$"
#set pattern "(\[5-9]\[0-9]\[0-9])|(\[1-9]\[0-9]{3,})"
#set filename passwd.txt

proc usage {} {
	# procedure definition
	puts "usage:"
	puts "$::argv0 pattern logfile";  # access global/special variable   
	exit
}


if { $argc != 2} {
	usage;    # calling the proc
}


set pattern [lindex $argv 0]
set filename [lindex $argv 1]

set fp [open $filename r]

while {[gets $fp line] >= 0} {
	if {[regexp -nocase $pattern $line]} {
		puts $line
	}
}

close $fp

