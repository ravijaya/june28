# demo for the file read

set fp [open passwd.txt2 r]

while {[gets $fp line] >= 0} {
	puts $line
}

close $fp
