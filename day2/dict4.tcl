set info [dict create host ws1 domain rootcap.in desc "web server" app "apache httpd" version 2.2]

puts $info
puts ""

set modified [dict remove $info desc host domain]
#set modified [dict remove $modified host]


puts $info
puts $modified
puts ""

# add
# update 
# delete 
# read aka lookup 
# iterate 
