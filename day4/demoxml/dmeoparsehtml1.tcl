package require tdom
package require http
set token [http::geturl "http://www.bing.com/search?q=tDOM"]
set html [http::data $token]
http::cleanup $token
set doc [dom parse -html $html]

foreach node [$doc selectNodes //a] {
    puts [$node getAttribute href]
}

