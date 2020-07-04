# demo for the file write, command line arguments 

if {$argc != 2} {
	puts  "usage: \n$argv0 src-file dest-file"
	exit 1
}

set source_file [lindex $argv 0]
set dest_file [lindex $argv 1]

if {[catch {set infile [open $source_file r]} errmesg]} {
	puts $errmesg
} else {
	set outfile [open $dest_file w]
	
	puts -nonewline $outfile [read $infile]  ; # copy
	flush $outfile
	
	close $infile
	close $outfile
}

