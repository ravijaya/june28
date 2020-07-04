# passing reference as argumnets 
# upvar is command,  used to ties name of the variable in the current scope to the variable in the different 
# call by ref.

proc increment {variable {value 1}} {
	upvar $variable localvariable
	set localvariable [expr $localvariable + $value]
}


set n 10
increment n
puts $n
increment  5
puts $n
