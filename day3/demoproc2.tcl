proc power {x {n 0}} {
	# definition with the default argumnets
	return [expr $x ** $n]
} 

puts [power 4 5];  # proc calling 
puts [power 4];  # proc calling 
