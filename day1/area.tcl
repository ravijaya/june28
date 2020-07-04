# demo for the io

set pi [expr 22 / 7.0]; # Command Substitution, comment as command

puts -nonewline "enter the radius :"
flush stdout
set radius [gets stdin]; # Command Substitution

set area [expr $pi * $radius ** 2]

set content [format "given radius : %s\narea : %.3f" $radius $area];  # variable Sub.
puts [string toupper $content]

