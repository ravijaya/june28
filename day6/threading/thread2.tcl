package require Thread

puts "*** main thread [thread::id]"
puts ""

# Create 3 threads
for {set thread 1} {$thread <= 3} {incr thread} {
    set id [thread::create -joinable {
    # Print a hello message 3 times, waiting
    # a random amount of time between messages
        for {set i 1} {$i <= 3} {incr i} {
            after [expr { int(500*rand()) }]
            puts "Thread [thread::id] says hello"
        }
    }] ; # thread::create

    puts "*** Started thread $id"
	

    lappend threadIds $id
} ;# for


foreach id $threadIds {
    thread::join $id
}
puts ""

puts "*** That's all, folks!"
puts "*** Existing main threads: [thread::names]"
# Wait until all other threads are finished

