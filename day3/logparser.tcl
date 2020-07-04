# genric log parser 

set pattern "0x\[0-9a-f]+"; # match hexa values 
# regular expr to match ipv4  a.b.c.d

set pattern "^b";  # match at begin of the line
set pattern "e$"; # match at end of line 
set pattern "^$"; # blank lines 
set pattern "b.t"; # . any char 
set pattern "b\[aeiou]t"
set pattern "b\[^aeiou]t"
set pattern "\\y\[6-9]\[0-9]{9}\\y";  # word boundary, repeatation modifier  
# set pattern "(\[0-9])(\[0-9])\.\\2\\1";  # regexp grouping 

set filename contacts.csv

if {[catch {set fp [open $filename r]} errMesg ]} {
	puts $errMesg
	exit 1
} else {
    while {[gets $fp line] >= 0} {
		
		if {[regexp -nocase  $pattern $line]} {
			puts $line
		} 
	}
}

