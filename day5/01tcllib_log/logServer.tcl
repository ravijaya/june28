proc logServer {channel addr port} {
    puts "Receiving logs from $addr:$port"
	while {![eof $channel]} {
		puts [gets $channel]
	}
}
socket -server logServer 1234  
vwait forever