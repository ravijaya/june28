package require tdom
set doc [dom parse [tDOM::xmlReadFile test.xml]]

# /tag/text()

# Selects the text content from all "tag" root node elements; in this case the value is returned instead of XML node
set book [$doc selectNodes /books/book]

if {[$book hasAttribute isbn]} {
   puts [$book getAttribute isbn]
}

puts [$book getAttribute notExisting "attribute not defined!"]

$book setAttribute year 2010

puts [$doc asXML]

