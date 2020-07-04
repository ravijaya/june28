package require tdom
set doc [dom parse [tDOM::xmlReadFile test.xml]]

# /tag/text()

# Selects the text content from all "tag" root node elements; in this case the value is returned instead of XML node

set authorNames [$doc selectNodes /books/book/authors/author/text()]

foreach authorName $authorNames {
	puts [$authorName nodeValue]
}



