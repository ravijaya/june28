package require tdbc::mysql 

oo::class create TaskModel {
	variable dbconn stmt resultSet
	
	constructor  {} {
		set dbconn [tdbc::mysql::connection new -user ravijaya -passwd ravi1234 -db june28 -host localhost -port 3306]
	}

	method dumpRows {} {
		# demo for the parameterized query 
		set query "insert into task (title, description) values (:title, :desc)"
		set stmt [$dbconn prepare $query]
		
		set data_set {
			"buy stationery"  "notebooks, pen, pad, sticy-notes"
			"buy shoes"  "flipflops, canvas, "
		}

		foreach {title desc} $data_set {
			$stmt execute;  # paramterized query
		}
		# $dbconn commit

		$stmt close
	}

	method getTasks {}  {
		set query  "select * from task"
		set stmt [$dbconn prepare $query]
		set resultSet [$stmt execute]
		puts [$resultSet columns]
		
		while {[$resultSet nextlist value]} {
			puts $value
		}
		
	}

	method getTaskById {id} {
		set query  "select * from task where id=$id"
		set stmt [$dbconn prepare $query]
		set resultSet [$stmt execute]
		$resultSet nextdict task
		return [dict create task $task]
	}

	method getTasksAsDict {}  {
		set query  "select * from task"
		set stmt [$dbconn prepare $query]
		set resultSet [$stmt execute]
		set content [list]
		
		while {[$resultSet nextdict value]} {
			lappend content $value
		}
		$stmt close
		return [dict create tasks $content]
	}
	
	method addTask {title desc} {
	        set query "insert into task (title, description) values (\"$title\", \"$desc\")"
		set stmt [$dbconn prepare $query]
		$stmt execute
		$stmt close

		set query  "select last_insert_id()"
		set stmt [$dbconn prepare $query]
		set resultSet [$stmt execute]
		$resultSet nextlist value
		# puts "items : $value"
		return [my getTaskById [lindex $value 0]]
	}
	
	destructor {
		$dbconn close
	}
}


