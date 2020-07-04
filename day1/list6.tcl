# insert

set names {sarah patric jane jack tim}

set names [linsert $names 0 Bangalore]; # prepend 
puts $names
puts ""

set names [linsert $names 2 one two]
puts $names
