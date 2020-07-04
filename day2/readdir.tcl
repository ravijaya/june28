set items [glob   -directory /home/ravijaya  *]
set filecontents [dict create]

foreach item $items {
	if {[file isfile $item]} {
		set file_type files
	} elseif {[file isdirectory $item]} {
		set file_type directories
	}
	dict lappend filecontents $file_type $item
}

foreach item [dict get $filecontents files] {
	puts $item
}
