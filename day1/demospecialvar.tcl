# demo for the tcl special variables

puts "version : $tcl_version"
puts ""
puts "system Information"
puts $tcl_platform(osVersion)
puts $tcl_platform(os)
puts $tcl_platform(machine)
puts ""
puts $tcl_library
puts ""
puts $env(USER)
# puts $env(HOSTNAME)
puts $env(PATH)

