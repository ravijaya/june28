set fp [open passwd.txt r]

set line_no 1

while {[gets $fp line] >= 0} {
	if {$line_no <= 10} {
		regsub -all : $line , line
	}
	puts $line
	incr line_no
}
close $fp
