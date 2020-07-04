package require log
set availableLevels [log::levels]
set availableLevels [lsort -command log::lvCompare -decreasing $availableLevels]

log::lvSuppressLE alert 0
set channel [open "messages.log" a]
log::lvChannelForall $channel
log::lvCmdForall myPuts
 
proc myPuts {lvl msg} {
    set now [clock seconds]
    set date [clock format $now]
    set channel [log::lv2channel $lvl]
    puts $channel [format "\[%s\] \[%-9s\] %s" $date $lvl $msg]
}

foreach level $availableLevels {
    log::log $level "some message"
}