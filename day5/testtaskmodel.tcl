
source ./demotask.tcl

TaskModel create task

puts [task getTasksAsDict]

task destroy


