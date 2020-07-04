proc dir_listing {list_of_dirs} {
  set container [dict create]

  foreach dir_name $list_of_dirs {
	set temp [dict create]
	foreach item [glob -directory $dir_name *] {
		if {[file isfile $item]} {
			set mtime [clock format [file mtime $item] -format "%d-%m-%Y %H:%M:%S"]
			set file_prop [list [file size $item] $mtime]
			dict set temp [file tail $item] $file_prop]
		}
	}
	dict set container $dir_name $temp
  }
  return $container 
}

