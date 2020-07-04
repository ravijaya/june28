package require Thread

puts "current thread : [thread::id]"
puts ""


set i 1

while {$i <= 5} {
	set threadId [thread::create {
			set threadId [thread::id]
			after 1000
			puts "child threads : $threadId"
		}
	]
	incr i
}

puts [thread::names]
puts ""

while {[llength [thread::names]] > 1} {
	after 500
}

puts "main thread preapres to terminate"

