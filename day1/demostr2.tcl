set fname larry
set lname wall
#append fname $lname
#puts $fname
# set i 1

# incr i
# puts $i

puts [string length $fname]
puts ""
#  strcmp  0, -1, 1

puts [string compare larry larry]
puts [string compare  -nocase larry Larry]
# puts [string compare larry zeal]

puts ""
puts [string equal sam sam]; # 1 denotes the true
puts [string equal sam mas]; # 0 denotes the false

puts "" 

puts [string first ring "sample string"]
puts [string first s "sample string"]
puts [string last s "sample string"]
