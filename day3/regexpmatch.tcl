set pattern P.+?N; # non-greedy match 
set s {the python and the perl scripting}

# regexp pattern matching 

if {[regexp -nocase $pattern $s match_string]} {
	puts "match string : $match_string"
} else {
	puts "failed to match :("
}

