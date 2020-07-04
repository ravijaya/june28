package require Tk

wm title .  "Feet 2 Meters"

grid [ttk::frame .c -padding "3 3 12 12"] -row 0 -column 0 -sticky nwes

ttk::entry .c.feet -width 7 -textvariable feet
grid .c.feet -column 2 -row 1 -sticky we


ttk::label .c.lblfeet -width 7 -text feet
grid .c.lblfeet -column 3 -row 1 -sticky we


grid [ttk::label .c.equ -text "is equivalen to "] -column 1 -row 2 -sticky we
grid [ttk::label .c.meters  -textvariable meters ] -column 2 -row 2 -sticky we
grid [ttk::label .c.meterslab -text "meters"] -column 3 -row 2 -sticky we


ttk::button .c.calc -text Calculate -command "compute" 
grid .c.calc -column 3 -row 3 -sticky we

focus .c.feet

bind . <Return>  {compute}


foreach child [winfo children .c] {
	grid configure $child -padx 5 -pady 5 
}

proc compute {} {
	if {[catch {set ::meters [expr round ($::feet * 0.3 * 10000.0)/10000.0]}]} {
		set ::meters err...
	}

}
