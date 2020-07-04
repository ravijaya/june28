set n 100; # global scope 

proc demo {} {
	global n;  # refers to the global scope 
	set n pip
	puts $n
}

demo
puts $n

