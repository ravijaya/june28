puts -nonewline "enter the a :"
flush stdout
gets stdin a

puts -nonewline "enter the b :"
flush stdout
gets stdin b
puts [catch {set s [expr $a + $b]} errmesg]
exit 0

if {[catch {set s [expr $a + $b]} errmesg]} {
	puts $errmesg
} else {
	puts "summation : $s"
}

puts ""
puts "next statement after error handling"
#puts [expr $s ** 3]


