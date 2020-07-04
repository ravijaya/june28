set s root:x:0:0:root:/root:/bin/bash

set items [split $s :] 
puts $items
puts "" 

puts [lindex [split $s :] 0]
puts [lindex [split $s :] end]
puts ""

set items {root x 0 0 root /root /bin/bash}
# from the list, create delimited string

set s2 [join $items ,]
puts $s2
