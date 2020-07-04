set s "root:x:0:0:root:/root:/bin/bash"
set pattern :
set replacement ,

regsub $pattern $s $replacement s2
puts $s2
puts ""

regsub -all $pattern $s $replacement s3
puts $s3
puts "" 

regsub -all -nocase "\[AEIOU]" $s3 "*" s4 
puts $s4
