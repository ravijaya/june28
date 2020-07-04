oo::class create PackageManager

oo::define PackageManager {
	variable Name Version

	constructor {name version} {
		set Name $name
		set Version $version
	}

	method get_information {} {
		puts "name : $Name"
		puts "version : $Version"
	} 
}


PackageManager create pm pip 2.2.18
pm get_information
