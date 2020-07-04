# demo for the joinable thread

package require Thread


puts "current main thread : [thread::id]"
puts ""


set i 1
set threads  [list]

while {$i <= 5} {
	set threadId [thread::create -joinable {
			set threadId [thread::id]
			set delay  [expr {int(500 * rand())}]
			after $delay
			puts "$threadId: waited for the : $delay"
		}
	]
	lappend threads $threadId
	incr i
}

puts [thread::names]
puts ""

foreach id $threads {
	thread::join $id
}

# main thread to wait for the joined thread to completes 

puts "main thread preapres to terminate"

