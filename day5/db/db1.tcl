package require tdbc::mysql

set dbconn [tdbc::mysql::connection new -user ravijaya -passwd ravi1234 -db june28 -host localhost]

set query "select version()"

set stmt [$dbconn prepare $query]

set res [$stmt execute ]

puts [$res columns]

while {[$res nextlist val]} {
	puts $val
}

$stmt close 
$dbconn close 

