# portion of the match can be extracted using regexp grouping 

set s {21/06/2020 09:33:08 a dummy log content}
set pattern "((\[0-9]{2})/(\[0-9]{2})/(\[0-9]{4}))\ (\[0-9]{2}:\[0-9]{2}:\[0-9]{2})"

if {[regexp $pattern $s timestamp date  day_of_month month year time]} {
	puts "match string : $timestamp"
	puts "group-1 : $date"
	puts $day_of_month
	puts $month
	puts $year
	puts "group-2 : $time"
} else {
	puts "failed to match "
}

