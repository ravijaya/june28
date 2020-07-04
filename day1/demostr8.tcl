puts [string repeat "-"  22]

set s "  peter  "
puts [format "|%s|"  [string trim $s]]
puts [format "|%s|"  [string trimright $s]]
puts [format "|%s|"  [string trimleft $s]]

