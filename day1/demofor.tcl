for {set i 1} {$i <= 5} {incr i} {
	for {set j 1}  {$j <= $i}  {incr j} {
		puts -nonewline "$j\t"
	}
	puts "";  # newline chara
}
