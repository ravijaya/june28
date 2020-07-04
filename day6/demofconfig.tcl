set s [socket localhost 22]
fconfigure $s -blocking 0



proc readMe {chan} {
				global out
                  if {[gets $chan line] < 0} {
                      if {[eof $chan]} {
                          close $chan
                          return
                      }
                      # Could not read a complete line this time; Tcl's
                      # internal buffering will hold the partial line for us
                      # until some more data is available over the socket.
                  } else {
                      puts stdout $line
					  set out 1	
                  }
              }

fileevent $s readable "readMe $s"
set out 0
vwait out
