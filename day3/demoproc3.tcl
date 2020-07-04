proc center {str_content width {fill_char " "}} {
	set times [expr ($width - [string length $str_content]) / 2] 
	set fillers  [string repeat $fill_char $times]
	return [format "%s%s%s" $fillers $str_content $fillers]

}

#puts [center perl 20 -]
# --perl--

proc ls {dir_names} {
	foreach dirname $dir_names {
		puts [center $dirname 50  "-"]

		foreach item [glob -directory $dirname *] {
			puts [file tail $item]
		}
		puts ""
	}
}

ls [list /tmp /home/ravijaya]
