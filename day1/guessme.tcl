set rand_value [expr int(rand() * 1000)]
set max_chance 10
set chance 1
set win_flag 0

while {$chance <= $max_chance} {
	set prompt [format "Chance : %s\nenter the value :" $chance]
	puts -nonewline $prompt
	flush stdout
	set user_value [gets stdin]

	if {$rand_value == $user_value} {
		puts "you won :) !!!!!!\n"
		set win_flag 1
		break
	} elseif {$user_value < $rand_value} {
		puts "$user_value: lesser\n"
	} else {
		puts "$user_value: greater\n"
	}
	incr chance
}

if {$win_flag == 0} {
	puts "you lost :(....."
}


