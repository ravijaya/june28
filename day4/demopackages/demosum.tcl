lappend auto_path [pwd]
package require Summation 1.0
package require Utils 1.0


puts [::Summation::sum [list 11 22 33]]
puts ""
puts $::Utils::desc
puts [::Utils::sqr_and_cube 15]
