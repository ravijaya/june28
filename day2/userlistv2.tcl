
set list_of_users [list]

if {[catch {set fp [open passwd.txt r]} errmesg]} {
	puts errmesg
	exit 1
} else {

	while {[gets $fp line] >= 0} {
		set user_information [split $line :]
		set login [lindex $user_information 0]
		lappend list_of_users $login
	}
	
	close $fp
	#puts $list_of_users
	#puts [llength $list_of_users]
	
	set line_no 1
	
	set fw [open userlist.txt w]

	foreach username  [lsort -nocase $list_of_users] {
		set content [format "%6s  %s" $line_no $username]
		puts $content
		puts $fw $content;  # file write 
		incr line_no
	}
	
	close $fw   	
}

