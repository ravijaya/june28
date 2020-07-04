oo::class create Person

oo::define Person {
	variable  firstName lastName

	constructor {fn ln} {
		set firstName $fn
		set lastName $ln
	}

	method get_info {} {
		puts "first name : $firstName"
		puts "last name : $lastName" 
	}
}

# Person create p larry wall 
# p get_info

oo::class create Employee {
	superclass Person

	variable Eid

	constructor {eid fn ln} {
		next $fn $ln
		set Eid $eid 		
	}

	method get_info {} {
		puts "employee id : $Eid"
		next
	}
}


Employee create e v4004 guido rossum
e get_info

