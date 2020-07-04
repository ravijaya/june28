set numbers {1 2 3 4 5}
set others {a e i o u}

set temp [concat $numbers $others]

puts $temp
puts [llength $temp]
puts ""

# iterate using tcl's iterator 
foreach item $temp {
	puts $item
}

