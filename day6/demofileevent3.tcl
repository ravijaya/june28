proc GetData {chan} {
    set data [read $chan]
    puts "[string length $data] $data"
   
    if {[eof $chan]} {
         fileevent $chan readable {}
    }
}

set chan [open /etc/passwd]
fconfigure $chan -blocking 0 -encoding binary
fileevent $chan readable [list GetData $chan]
close $chan 


