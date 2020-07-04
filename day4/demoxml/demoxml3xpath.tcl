package require tdom
set doc [dom parse [tDOM::xmlReadFile test.xml]]

set authors [$doc selectNodes /books/book/authors]

foreach author [$authors childNodes] {
   puts [[$author firstChild] nodeValue]
}

