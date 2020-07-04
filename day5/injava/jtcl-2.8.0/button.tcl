package require java
java::import java.awt.Button
java::import java.awt.Frame

set f [java::new Frame]
set b [java::new Button "Press Me"]

$f setSize 300 300
$f add $b
$f show

