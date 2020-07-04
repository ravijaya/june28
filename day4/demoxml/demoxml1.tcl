package require tdom
set channel [open test.xml]
fconfigure $channel -encoding utf-8
set doc [dom parse -channel $channel]
puts $doc
# set doc [dom parse [read $channel]]
close $channel

