set info [dict create host ws1 domin rootcap.in desc "web server" app "apache httpd" version 2.2];  # init a dict 

puts $info
puts ""

set key version

if {[dict exists $info $key]} {;   # validate for the key in dict
	dict set info $key 3.6;   # update an item
}

puts $info
puts ""

dict set info arch x86_64;   # add an element
puts $info
puts ""

dict append info release {green parrot};  # add an element info dict
puts $info
puts ""

