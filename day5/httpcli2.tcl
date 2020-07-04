package require http 2
package require tls 1.7
http::register https 443 [list ::tls::socket -autoservername true]
set url "https://reqres.in/api/users?page=2"
set token [http::geturl $url -channel stdout]



