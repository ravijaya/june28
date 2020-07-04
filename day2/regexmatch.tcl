# demo for the regexp pattern matching 

set s {the python and the perl scripting}
set pattern "P.+?N";  # non-greedy match

if {[regexp -nocase $pattern $s match_str]} {
	puts "got a match : $match_str"
} else {
	puts "failed to match :(..."
}
