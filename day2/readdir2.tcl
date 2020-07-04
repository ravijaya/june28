set items [glob   -directory /home/ravijaya  *]

foreach item $items {
	if {[file isfile $item]} {
		puts $item
		puts "size : [file size $item]"
		puts "modified time : [file mtime $item]"
		set mtime [file mtime $item]
		puts "human modfied time : [clock format $mtime -format {%Y-%m-%d %H:%M:%S}]"
		puts ""
	}
}


