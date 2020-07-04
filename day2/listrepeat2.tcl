# list of a list 
set temp [lrepeat 3 {1 2 3}]
puts $temp
puts [llength $temp]

puts [lindex $temp 0]
puts ""

set temp {{1 2 3} {4 5 6} {7 8 9}};  # 3 x 3, list of list 

lset temp 1 1 x;  # update an element 

foreach row  $temp {
	foreach col $row {
		puts -nonewline "$col\t"
	}
	puts ""
}

