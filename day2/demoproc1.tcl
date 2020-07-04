# demo for the tcl proc 

proc power {x {n 0}} {
	# definition with default arguments 
	return [expr $x ** $n]
}


puts [power 3 4];   # call the proc 
puts [power 3];   # call the proc 

