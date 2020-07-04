# string sub

set s "the tcl and the perl scripting"

set s2 [string map {the The} $s]
puts $s
puts $s2

puts ""

set s "tool common lang"
set first_half [string range $s 0 3];  # sub string

set len [string length $s]
set last_half [string range $s [expr $len-4] [expr $len-1]]

puts "$first_half @@@ $last_half"
