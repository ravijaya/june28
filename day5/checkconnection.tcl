package require tdbc::mysql

set dbconn [tdbc::mysql::connection new -user ravijaya -passwd ravi1234 -db june28 -h localhost]

set query "select version()"
set stmt [$dbconn prepare $query]

set resSet [$stmt execute]

puts [$resSet columns]
$resSet nextlist value

puts $value

$stmt close 
$dbconn close 

