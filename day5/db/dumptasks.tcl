package require tdbc::mysql

set dbconn [tdbc::mysql::connection new -user ravijaya -passwd ravi1234 -db june28 -host localhost]

set query "insert into task (title, description) values (:title, :description)"

set stmt [$dbconn prepare $query]

foreach {title description} {
	"Buy groceries" "Milk, Cheese, Pizza, Fruit, Tylenol"
	"Learn German" "Need to find a good Germain tutor on the web"
} {
	$stmt execute  ; # parameterized query
}

$stmt close 
$dbconn close 

