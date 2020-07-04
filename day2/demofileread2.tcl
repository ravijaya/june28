# demo for the error handling 

if {[catch {set fp [open passwd.txt r]} errmesg]} {
	puts $errmesg
} else {

	while {[gets $fp line] >= 0} {
		puts $line
	}

	close $fp
}
