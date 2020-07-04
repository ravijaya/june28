# create namespace 
namespace eval ::Utils {
	namespace export desc power sqr_and_cube
	variable desc  "a sample tcl package";  # namespace variable 
}

proc ::Utils::power {x, {n 0}} {
	return [expr $x ** $n]
}

proc ::Utils::sqr_and_cube {value} {
	return [list [expr $value ** 2] [expr $value ** 3]];  # multiple values from a proc 
}

package provide Utils 1.0

