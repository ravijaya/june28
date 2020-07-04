set destdir catch22

if {![file isdirectory $destdir]}  {
	file mkdir $destdir
}

puts [pwd]

file copy /etc/passwd $destdir
cd $destdir

puts [pwd]

file delete passwd



