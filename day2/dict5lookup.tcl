# lookup aka read

set info [dict create host ws1 domain rootcap.in desc "web server" app "apache httpd" version 2.2]

puts [dict get $info host]
puts [dict get $info domain]

if {[catch {set value [dict get $info app]} errmesg]} {
	puts $errmesg
} else {
	puts $value
}

