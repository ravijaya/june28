# sort 

set names {sarah patric jane jack tim}

set sorted [lsort $names]
puts $sorted 
puts ""

set reversed  [lsort -decreasing $names]
puts $reversed
puts ""

set items {1 2 3 4 10 1.1 9 1000 123.12 10 10001 99}
puts [lsort $items]
puts  ""

set items {1 2 3 4 10 1.1 9 1000 123.12 10 10001 99}
puts [lsort -real -decreasing $items]
puts ""

