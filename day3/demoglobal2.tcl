set n 100; # global scope 
puts $tcl_version


proc demo {} {
	global tcl_version
	set n pip

	puts "local = $n"
	puts "global = $::n";  # global scope 
	puts $tcl_version
}

demo

