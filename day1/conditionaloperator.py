 #syntax for the Ternary Operator
 # 
 # test-condition?true-part-expr:false-part-expr


set n 14 

set result [expr $n > 5? $n ** 2 : $n ** 3]
puts $result
