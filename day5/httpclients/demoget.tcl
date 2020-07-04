package require http 2
package require rest
package require tls 1.7
http::register https 443 [list ::tls::socket -autoservername true]

set uri "https://reqres.in/api/users?page=2"

set res [::rest::get $uri]
puts [::rest::format_json $res]

