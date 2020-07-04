package require java
set jstr [java::new String "A Java String"]
puts [$jstr charAt 2]
puts [$jstr toString]
unset jstr
