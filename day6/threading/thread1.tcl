package require Thread


puts "*** main thread [thread::id]"
puts ""

# Create 3 threads
for {set thread 1} {$thread <= 3} {incr thread} {
    set id [thread::create {
    # Print a hello message 3 times, waiting
    # a random amount of time between messages

        for {set i 1} {$i <= 3} {incr i} {
			set delay [expr { int(500*rand()) }]
            after $delay; # milliseconds 
            puts "Thread [thread::id] waited for : $delay"
        }
    }] ;# thread::create
    puts "*** Started thread $id"
	puts ""
}; # for

# Wait until all other threads are finished

while {[llength [thread::names]] > 1} {
    after 500
}

puts "*** That's all, folks!"
puts "*** Existing main thread"
puts ""

