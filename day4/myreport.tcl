# import pdf4tcl
package require pdf4tcl

# create a pdf object
pdf4tcl::new mypdf -paper a4 -margin 15mm

# add the first page
mypdf startPage
set width [lindex [mypdf getDrawableArea] 0]

# draw a line, coordinates start in upper left corner of the paper,
# unit is postscript point, which is 1/72 inch
mypdf line 0 0 $width 0;  # x1 y1 x2 y2

set fp [open passwd.txt]

mypdf setFont 12 Helvetica

set y 12

while {[gets $fp line] >= 0} {
	 mypdf text $line -x 0 -y $y
	 incr y 12
}


# write pdf to a file
mypdf write -file mypasswd.pdf

# cleanup memory and unset procedures and variables
mypdf destroy
