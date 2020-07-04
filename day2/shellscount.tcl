
set frequency [dict create]

set fp [open passwd.txt r]

while {[gets $fp line] >= 0} {
	set shell [lindex [split $line :] end]
	dict incr frequency $shell  ;  # add an element or updates 
}

close $fp

dict for {shell count} $frequency {
	puts "$shell -> \[$count]"
}

