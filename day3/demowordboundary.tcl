set s {the sunflower follow the Sun form the dawn to the dusk}
set pattern "\\ysun\\y";  #word boundary 


if {[regexp -nocase $pattern $s match]} {
	puts $match
}
