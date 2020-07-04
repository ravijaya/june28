set tclfiles [glob ../*.tcl]
puts "Name - date of last modification"
foreach f $tclfiles {
    puts "$f - [clock format [file mtime $f] -format %x]"
}
