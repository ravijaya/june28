oo::class create Alpha {
	method pprint {} {
		puts "pprint from the class Alpha"
	}
}


oo::class create Beta {
	method pprint {} {
		puts "pprint from the class Beta"
	}
}

oo::class create Charlie {
	superclass Beta Alpha

	method pprint {} {
		nextto Alpha
		nextto Beta
	}
}

Charlie create c
c pprint
