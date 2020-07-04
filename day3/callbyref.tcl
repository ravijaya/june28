# call by references 

proc add_items {numbers} {
	upvar $numbers list_ref
	lappend list_ref 4
	lappend list_ref 5
	lappend list_ref 6
}


set items [list 11 22 33]
add_items items

foreach item $items {
	puts $item 
}
