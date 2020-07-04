set fp [open passwd.txt r]
    set hashmap [dict create]
    while {[gets $fp line] >=0} {
      set firstindex [lindex [split $line :] 0]
      set endindex [lindex [split $line :] end]
       dict lappend hashmap $endindex $firstindex;  # adding element to dict 
       
    }
close $fp

    dict for {key value} $hashmap {
      puts "$key -> $value"
      }
