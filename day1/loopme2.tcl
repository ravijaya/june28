# loops  & conditions 

set i 1

while {$i <= 10} {
	if {$i == 1} {
		puts one
	} elseif {$i == 2} {
		puts ii
	} elseif {$i == 5} {
		incr i
		continue
	} elseif {$i == 7} {
		break
	} else {
		puts $i
	}
	incr i
}

