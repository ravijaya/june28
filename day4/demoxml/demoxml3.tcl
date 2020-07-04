package require tdom
set doc [dom parse [tDOM::xmlReadFile test.xml]]
puts $doc
puts ""

set authors [$doc getElementsByTagName authors]

foreach author [$authors childNodes] {
    puts [[$author firstChild] nodeValue]
}

