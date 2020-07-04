package require log
set availableLevels [log::levels]
set availableLevels [lsort -command log::lvCompare -decreasing $availableLevels]

log::lvSuppressLE alert 0
set channel [socket localhost 1234]

log::lvChannelForall $channel
log::lvCmdForall myPuts
 
proc myPuts {lvl msg} {
    set now [clock seconds]
    set date [clock format $now]
    set channel [log::lv2channel $lvl]
    set lvl "\[$lvl[string repeat " " [expr 9 - [string length $lvl]]]\]"
    puts $channel "\[$date\] $lvl  $msg"
	flush $channel
}

foreach level $availableLevels {
    log::log $level "some message"
}