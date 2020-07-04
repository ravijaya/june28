puts "name of the current script : $argv0"
puts "length of arguments : $argc "
puts "command line argumnets : $argv";  # would be list  
puts [format "first item : %s" [lindex $argv 0]]
puts [format "last  item : %s" [lindex $argv end]]
