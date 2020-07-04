set fp [open listing.dat r]

set pattern  "\[^ ]+"

while {[gets $fp line] >= 0} {
	set user_record [regexp -inline -all $pattern $line]
	puts [lindex $user_record 4]
}
close $fp
