# for loop 

for {set i 1} {$i <= 15} {incr i} {
    puts [format "|%10b|%10o|%10x|" $i $i $i]
}


# puts [format "|%-10b|%-10o|%-10x|" 15 15 15]
