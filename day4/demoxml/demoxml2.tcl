package require tdom
set doc [dom parse [tDOM::xmlReadFile test.xml]]
puts $doc
puts ""

set authors [$doc getElementsByTagName authors]
puts "<authors> has child nodes: [$authors hasChildNodes]"
set author [$authors firstChild]
puts [[$author firstChild] nodeValue]
set author [$author nextSibling]
puts [[$author firstChild] nodeValue]


