package require Thread
package require http 2
package require tls 1.7


proc makeRequest {url responseFile} {
    http::register https 443 [list ::tls::socket -autoservername true]
	set tid [thread::id]
	set outFile [open $responseFile a]
	puts "thread #id : $tid : $url"
	::http::geturl $url -channel stdout  -blocksize 1024
	close $outFile

}


set list_of_threads [list]
set urls [ list http://python.org http://linux.org http://kernel.org http://golang.org]


foreach url $urls {
	set tid [thread::create -joinable {
		proc makeRequest {url responseFile} {
			http::register https 443 [list ::tls::socket -autoservername true]
			set tid [thread::id]
			set outFile [open $responseFile a]
			puts "thread #id : $tid : $url"
			::http::geturl $url -channel stdout  -blocksize 1024
			close $outFile

		}

	}]
	lappend list_of_threads $tid

	thread::send $tid [list set url $url]
	thread::send $tid { makeRequest $url a.out }
}
		


