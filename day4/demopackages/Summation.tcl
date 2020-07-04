namespace eval ::Summation {
	# create namespace 
	namespace export sum   
	set version 1.0
}

proc ::Summation::sum {list_of_values} {
	set tot 0

	foreach item $list_of_values {
		incr tot $item		
	}

	return $tot 
}

package provide Summation $::Summation::version
