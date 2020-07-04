set info [dict create host ws1 domin rootcap.in desc "web server" app "apache httpd" version 2.2]

puts [dict keys $info]
puts ""
puts [dict values $info]
puts ""

# iterate for its key value pair

dict for {key value}  $info {
	puts "$key -> $value"
}


