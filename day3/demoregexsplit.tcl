set s "root,x:0:0 root,/root;/bin/bash";  # hetero delimited content 

# regexp split operator 
set pattern "\[^,: ;]+"

set items [regexp -all -inline $pattern $s]
puts $items
puts ""

foreach item $items {
	puts $item
}

