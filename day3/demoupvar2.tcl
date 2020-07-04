proc setpositive {variable value} {
	upvar $variable myvar

	if {$value < 0} {
		set myvar [expr -($value)]
	} else {
		set myvar $value
	}
	return $myvar
}

setpositive x -10
puts $x
puts ""
setpositive z -123
puts $z
puts ""
setpositive xyx -10
puts $xyx
puts ""
