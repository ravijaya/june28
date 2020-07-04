# demo for the group by

set group_by [dict create]

set fp [open passwd.txt r]

while {[gets $fp line] >= 0} {
	set users [split $line :]
	set user [lindex $users 0]
	set shell [lindex $users end]
	dict lappend group_by $shell $user;  # dict of list 
}

close $fp

#puts $group_by

dict for {shell list_of_users} $group_by {
	puts "$shell :"
	foreach user $list_of_users {
		puts "\t$user"
	}
	puts ""
}
