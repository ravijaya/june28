set pipe [open "|ls -l" r]

fileevent $pipe readable [list Reader $pipe]

proc Reader { pipe } {
	puts $pipe


    if [eof $pipe] {
        catch {close $pipe}
        return
    }
    
    gets $pipe line
	puts $line
    # Process one line
}

