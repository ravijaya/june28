set s "root:x:0:0:root:/root:/bin/bash"
set delimiter :

set items [split $s $delimiter ]

# puts $items
# to iterate  a list we need tcl's iterator 

foreach item $items {
	puts $item
}

