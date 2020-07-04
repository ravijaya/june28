set items {1 2 three 4 5}
set modified [lreplace $items 2 2];   # deleting the 3rd item of the list 
puts $modified
puts ""


set items {1 2 three 4 5}
set modified [lreplace $items 2 3 iii 4.4];   # update the 3rd element 
puts $modified
puts ""

set items  {1 2 3}
lset items 2 3.3;   # update 
puts $items 

