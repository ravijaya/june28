 oo::class create printable {
        method print {} {
            foreach v [info class variables [info object class [self]]] {
                my variable $v
                puts "$v: [set $v]"
            }
        }
    }

    oo::class create counter {
        variable count
        constructor {} {
            set count 0
        }
        method incr {} {
            incr count
        }
        mixin printable
    }

    counter create countup

    countup incr
    countup incr
    countup print
